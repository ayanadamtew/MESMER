import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mesmer_app/features/enterprise/providers/enterprise_provider.dart';
import 'package:mesmer_app/features/messaging/providers/messages_provider.dart';
import 'package:mesmer_app/core/config/router_config.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/common_widgets.dart';

class MessagingListScreen extends ConsumerWidget {
  const MessagingListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enterprisesAsync = ref.watch(enterpriseListProvider);

    return Scaffold(
      appBar: const MesmerAppBar(title: 'Messages'),
      body: enterprisesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (enterprises) {
          if (enterprises.isEmpty) {
            return const EmptyStateWidget(
              icon: Icons.chat_bubble_outline_rounded,
              title: 'No enterprises yet',
              subtitle: 'Add an enterprise to start chatting with them.',
            );
          }

          return ListView.separated(
            itemCount: enterprises.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final enterprise = enterprises[i];
              return _EnterpriseChatTile(enterprise: enterprise);
            },
          );
        },
      ),
    );
  }
}

class _EnterpriseChatTile extends ConsumerWidget {
  const _EnterpriseChatTile({required this.enterprise});

  final dynamic enterprise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final latestMsgAsync = ref.watch(latestMessageProvider(enterprise.uuid));

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
        child: Text(
          enterprise.businessName[0].toUpperCase(),
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              enterprise.businessName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          latestMsgAsync.when(
            data: (msg) => msg != null
                ? Text(
                    DateFormat.jm().format(msg.sentAt),
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  )
                : const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
      subtitle: latestMsgAsync.when(
        data: (msg) => Text(
          msg?.text ?? 'Tap to view messages',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: msg != null 
                ? Theme.of(context).textTheme.bodyMedium?.color
                : Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.7),
          ),
        ),
        loading: () => const Text('Loading...'),
        error: (_, __) => const Text('Tap to view messages'),
      ),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: () => context.push(
        AppRoutes.chat.replaceAll(':enterpriseId', enterprise.uuid),
        extra: {
          'receiverId': enterprise.ownerId ?? '',
          'chatTitle': enterprise.businessName,
        },
      ),
    );
  }
}
