import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mesmer_app/features/enterprise_portal/providers/linked_enterprise_provider.dart';
import 'package:mesmer_app/features/messaging/screens/chat_screen.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';

class EnterpriseMessagesScreen extends ConsumerWidget {
  const EnterpriseMessagesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enterpriseAsync = ref.watch(linkedEnterpriseProvider);

    return Scaffold(
      body: enterpriseAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (enterprise) {
          if (enterprise == null) {
            return const Center(
              child: Text('No enterprise linked. Please link your account first to access messages.'),
            );
          }

          // If there is no coach ID assigned yet, inform the user
          if (enterprise.coachId == null) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.xl),
                child: Text(
                  'Your enterprise doesn\'t have an assigned coach yet. Messages will be enabled when a coach is assigned.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
          }

          // Enterprise owner talks to their assigned coach
          return ChatScreen(
            enterpriseId: enterprise.uuid,
            receiverId: enterprise.coachId!, 
            chatTitle: 'My Coach',
          );
        },
      ),
    );
  }
}
