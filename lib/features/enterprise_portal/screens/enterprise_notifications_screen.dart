import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:intl/intl.dart';
import 'package:mesmer_app/features/enterprise_portal/providers/linked_enterprise_provider.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/shared/models/coaching_session.dart';
import 'package:mesmer_app/shared/models/progress_indicator_record.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';
import 'package:mesmer_app/shared/models/training_schedule.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/common_widgets.dart';

class EnterpriseNotificationsScreen extends ConsumerWidget {
  const EnterpriseNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MesmerAppBar(title: 'Notifications & Alerts'),
      body: FutureBuilder<List<_NotificationItem>>(
        future: _loadNotifications(ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final items = snapshot.data ?? [];

          if (items.isEmpty) {
            return const EmptyStateWidget(
              icon: Icons.notifications_none_rounded,
              title: 'No notifications',
              subtitle: 'You\'re all caught up!',
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: items.length,
            itemBuilder: (_, i) {
              final item = items[i];
              return Card(
                margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: item.color.withValues(alpha: 0.1),
                    child: Icon(item.icon, color: item.color),
                  ),
                  title: Text(item.title),
                  subtitle: Text(item.subtitle),
                  trailing: Text(
                    item.timeAgo,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<_NotificationItem>> _loadNotifications(WidgetRef ref) async {
    final items = <_NotificationItem>[];
    
    final enterprise = await ref.read(linkedEnterpriseProvider.future);
    if (enterprise == null) return items;

    // Upcoming sessions
    final now = DateTime.now();
    final sessions = await IsarService.sessions
        .filter()
        .enterpriseIdEqualTo(enterprise.uuid)
        .statusEqualTo(SessionStatus.scheduled)
        .scheduledAtGreaterThan(now)
        .sortByScheduledAt()
        .findAll();

    for (final s in sessions) {
      items.add(_NotificationItem(
        icon: Icons.event_rounded,
        color: AppColors.primary,
        title: 'Upcoming Coaching Session',
        subtitle:
            'Scheduled for ${DateFormat.yMMMd().add_jm().format(s.scheduledAt)}',
        timestamp: s.scheduledAt,
      ));
    }

    // Recent completed sessions (feedback available)
    final completed = await IsarService.sessions
        .filter()
        .enterpriseIdEqualTo(enterprise.uuid)
        .statusEqualTo(SessionStatus.completed)
        .sortByScheduledAtDesc()
        .limit(5)
        .findAll();

    for (final s in completed) {
      if (s.recommendations != null && s.recommendations!.isNotEmpty) {
        items.add(_NotificationItem(
          icon: Icons.lightbulb_rounded,
          color: AppColors.accent,
          title: 'New Recommendations Available',
          subtitle: 'Your coach left feedback from the ${s.sessionType.name} session',
          timestamp: s.conductedAt ?? s.scheduledAt,
        ));
      }
    }

    // Loan reminders from enterprises
    if ((enterprise.baselineBookkeepingScore ?? 100) < 40) {
      items.add(_NotificationItem(
        icon: Icons.warning_amber_rounded,
        color: AppColors.warning,
        title: 'Bookkeeping Needs Attention',
        subtitle: '${enterprise.businessName}: Score is below 40%. Review your records.',
        timestamp: now,
      ));
    }

    // Training schedule alerts
    final trainings = await IsarService.trainings
        .filter()
        .isCompletedEqualTo(false)
        .scheduledAtGreaterThan(now)
        .sortByScheduledAt()
        .findAll();

    for (final t in trainings) {
      items.add(_NotificationItem(
        icon: Icons.school_rounded,
        color: AppColors.financeColor,
        title: 'Upcoming Training: ${t.title}',
        subtitle:
            '${DateFormat.yMMMd().add_jm().format(t.scheduledAt)} • ${t.durationMinutes} min',
        timestamp: t.scheduledAt,
      ));
    }

    // Milestone alerts (check for recent progress improvements)
    final progressRecords = await IsarService.progressRecords
        .filter()
        .enterpriseIdEqualTo(enterprise.uuid)
        .sortByRecordedAt()
        .findAll();
        
    if (progressRecords.length >= 2) {
      final sorted = [...progressRecords]
        ..sort((a, b) => a.recordedAt.compareTo(b.recordedAt));
      final latest = sorted.last;
      final previous = sorted[sorted.length - 2];

      if (latest.bookkeepingScore != null &&
          previous.bookkeepingScore != null &&
          latest.bookkeepingScore! - previous.bookkeepingScore! >= 10) {
        items.add(_NotificationItem(
          icon: Icons.emoji_events_rounded,
          color: AppColors.success,
          title: '🎉 Milestone: Bookkeeping Improved!',
          subtitle:
              'Score improved by ${(latest.bookkeepingScore! - previous.bookkeepingScore!).toStringAsFixed(0)} points',
          timestamp: latest.recordedAt,
        ));
      }

      if (latest.salesVolume != null &&
          previous.salesVolume != null &&
          previous.salesVolume! > 0 &&
          ((latest.salesVolume! - previous.salesVolume!) / previous.salesVolume! * 100) >= 15) {
        items.add(_NotificationItem(
          icon: Icons.trending_up_rounded,
          color: AppColors.success,
          title: '🎉 Milestone: Sales Growth!',
          subtitle:
              'Sales volume grew by ${((latest.salesVolume! - previous.salesVolume!) / previous.salesVolume! * 100).toStringAsFixed(0)}%',
          timestamp: latest.recordedAt,
        ));
      }
    }

    // Sort by timestamp
    items.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return items;
  }
}

class _NotificationItem {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final DateTime timestamp;

  _NotificationItem({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.timestamp,
  });

  String get timeAgo {
    final diff = DateTime.now().difference(timestamp);
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'Now';
  }
}
