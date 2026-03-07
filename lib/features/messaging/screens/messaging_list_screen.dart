import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mesmer_app/core/config/router_config.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/common_widgets.dart';

class MessagingListScreen extends ConsumerWidget {
  const MessagingListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MesmerAppBar(title: 'Messages'),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: Supabase.instance.client
            .from('chat_rooms')
            .select()
            .order('last_message_at', ascending: false),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final rooms =
              List<Map<String, dynamic>>.from(snapshot.data ?? []);

          if (rooms.isEmpty) {
            return const EmptyStateWidget(
              icon: Icons.chat_bubble_outline_rounded,
              title: 'No conversations yet',
              subtitle: 'Tap a coach or enterprise to start a conversation.',
            );
          }

          return ListView.separated(
            itemCount: rooms.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final room = rooms[i];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                  child: Text(
                    (room['name'] as String? ?? 'C')[0].toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                title: Text(room['name'] as String? ?? 'Conversation'),
                subtitle: Text(
                  room['last_message'] as String? ?? 'No messages yet',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: room['last_message_at'] != null
                    ? Text(
                        DateFormat.jm().format(
                          DateTime.parse(room['last_message_at'] as String),
                        ),
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    : null,
                onTap: () => context.push(
                  AppRoutes.chat.replaceAll(':chatId', room['id'] as String),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit_rounded),
      ),
    );
  }
}
