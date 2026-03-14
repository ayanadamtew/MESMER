import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:intl/intl.dart';
import 'package:mesmer_app/features/enterprise_portal/providers/linked_enterprise_provider.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/shared/models/coaching_session.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/common_widgets.dart';

class EnterpriseRecommendationsScreen extends ConsumerWidget {
  const EnterpriseRecommendationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MesmerAppBar(title: 'Coach Recommendations'),
      body: FutureBuilder<List<CoachingSession>>(
        future: _loadNotes(ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final sessions = snapshot.data ?? [];

          if (sessions.isEmpty) {
            return const EmptyStateWidget(
              icon: Icons.lightbulb_outline,
              title: 'No recommendations yet',
              subtitle: 'Your coach will add tips after each session.',
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: sessions.length,
            itemBuilder: (_, i) {
              final s = sessions[i];
              return _RecommendationCard(session: s);
            },
          );
        },
      ),
    );
  }

  Future<List<CoachingSession>> _loadNotes(WidgetRef ref) async {
    final enterprise = await ref.read(linkedEnterpriseProvider.future);
    if (enterprise == null) return [];
    
    return IsarService.sessions
        .filter()
        .enterpriseIdEqualTo(enterprise.uuid)
        .recommendationsIsNotEmpty()
        .sortByScheduledAtDesc()
        .findAll();
  }
}

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard({required this.session});

  final CoachingSession session;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(
                  _statusIcon(session.status),
                  color: _statusColor(session.status),
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  DateFormat.yMMMd().format(session.scheduledAt),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.textSecondaryLight,
                      ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: _statusColor(session.status).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Text(
                    session.sessionType.name,
                    style: TextStyle(
                      color: _statusColor(session.status),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Recommendations
            if (session.recommendations != null &&
                session.recommendations!.isNotEmpty) ...[
              Text(
                'Recommendations',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                session.recommendations!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],

            // Next Steps
            if (session.nextSteps != null &&
                session.nextSteps!.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.md),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.info.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(
                    color: AppColors.info.withValues(alpha: 0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.flag_rounded,
                            color: AppColors.info, size: 16),
                        const SizedBox(width: AppSpacing.xs),
                        Text(
                          'Next Steps',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: AppColors.info),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(session.nextSteps!),
                  ],
                ),
              ),
            ],

            // Notes
            if (session.notes != null && session.notes!.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.md),
              Text(
                'Session Notes',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.textSecondaryLight,
                    ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                session.notes!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _statusIcon(SessionStatus status) {
    switch (status) {
      case SessionStatus.completed:
        return Icons.check_circle_outline;
      case SessionStatus.active:
        return Icons.play_circle_outline;
      case SessionStatus.scheduled:
        return Icons.schedule;
      case SessionStatus.cancelled:
        return Icons.cancel_outlined;
    }
  }

  Color _statusColor(SessionStatus status) {
    switch (status) {
      case SessionStatus.completed:
        return AppColors.success;
      case SessionStatus.active:
        return AppColors.primary;
      case SessionStatus.scheduled:
        return AppColors.accent;
      case SessionStatus.cancelled:
        return AppColors.error;
    }
  }
}
