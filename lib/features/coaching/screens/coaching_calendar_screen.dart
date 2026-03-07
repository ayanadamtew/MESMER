import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:mesmer_app/core/config/router_config.dart';
import 'package:mesmer_app/features/coaching/providers/coaching_provider.dart';
import 'package:mesmer_app/shared/models/coaching_session.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/common_widgets.dart';

class CoachingCalendarScreen extends ConsumerStatefulWidget {
  const CoachingCalendarScreen({super.key});

  @override
  ConsumerState<CoachingCalendarScreen> createState() =>
      _CoachingCalendarScreenState();
}

class _CoachingCalendarScreenState
    extends ConsumerState<CoachingCalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  List<CoachingSession> _sessionsForDay(DateTime day) {
    final all = ref.watch(allSessionsProvider).valueOrNull ?? [];
    return all
        .where(
          (s) =>
              s.scheduledAt.year == day.year &&
              s.scheduledAt.month == day.month &&
              s.scheduledAt.day == day.day,
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final sessionsAsync = ref.watch(allSessionsProvider);

    return Scaffold(
      appBar: const MesmerAppBar(title: 'Coaching Calendar'),
      body: Column(
        children: [
          TableCalendar<CoachingSession>(
            firstDay: DateTime.utc(2023),
            lastDay: DateTime.utc(2028),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            eventLoader: _sessionsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: (selected, focused) {
              setState(() {
                _selectedDay = selected;
                _focusedDay = focused;
              });
            },
            onFormatChanged: (format) =>
                setState(() => _calendarFormat = format),
            onPageChanged: (focused) =>
                setState(() => _focusedDay = focused),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              selectedDecoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              markerDecoration: const BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonDecoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              titleCentered: true,
              formatButtonTextStyle:
                  const TextStyle(color: AppColors.primary),
            ),
          ),
          const Divider(height: 1),
          // Sessions for selected day
          Expanded(
            child: sessionsAsync.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (_) {
                final daySessions =
                    _sessionsForDay(_selectedDay ?? DateTime.now());
                if (daySessions.isEmpty) {
                  return EmptyStateWidget(
                    icon: Icons.event_note_outlined,
                    title: 'No sessions scheduled',
                    subtitle: _selectedDay != null
                        ? DateFormat.yMMMd().format(_selectedDay!)
                        : 'Select a date to view sessions',
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  itemCount: daySessions.length,
                  itemBuilder: (_, i) =>
                      _SessionTile(session: daySessions[i]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _createSessionDialog(),
        icon: const Icon(Icons.add),
        label: const Text('Schedule Session'),
      ),
    );
  }

  Future<void> _createSessionDialog() async {
    // Simple dialog – full implementation would include enterprise picker
    final notifier = ref.read(coachingProvider.notifier);
    final date = _selectedDay ?? DateTime.now();

    await showDialog<void>(
      context: context,
      builder: (ctx) => _NewSessionDialog(
        date: date,
        onConfirm: (enterpriseId, type) async {
          final session = CoachingSession()
            ..enterpriseId = enterpriseId
            ..coachId = 'current-coach-id'
            ..sessionType = type
            ..status = SessionStatus.scheduled
            ..scheduledAt = date
            ..createdAt = DateTime.now();

          await notifier.scheduleSession(session);
          if (!ctx.mounted) return;
          Navigator.pop(ctx);
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Session scheduled!'),
              backgroundColor: AppColors.success,
            ),
          );
        },
      ),
    );
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile({required this.session});

  final CoachingSession session;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: const Icon(
            Icons.handshake_outlined,
            color: AppColors.primary,
            size: 20,
          ),
        ),
        title: Text(
          session.enterpriseId,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          '${_formatType(session.sessionType)} · ${DateFormat.jm().format(session.scheduledAt)}',
        ),
        trailing: StatusChip(
          label: session.status.name,
          color: _statusColor(session.status),
        ),
        onTap: () => context.push(
          AppRoutes.activeSession.replaceAll(':sessionId', session.uuid),
        ),
      ),
    );
  }

  String _formatType(SessionType t) {
    switch (t) {
      case SessionType.initial:
        return 'Initial';
      case SessionType.followUp:
        return 'Follow-up';
      case SessionType.final_:
        return 'Final';
      case SessionType.emergency:
        return 'Emergency';
    }
  }

  Color _statusColor(SessionStatus s) {
    switch (s) {
      case SessionStatus.scheduled:
        return AppColors.info;
      case SessionStatus.active:
        return AppColors.warning;
      case SessionStatus.completed:
        return AppColors.success;
      case SessionStatus.cancelled:
        return AppColors.error;
    }
  }
}

class _NewSessionDialog extends StatefulWidget {
  const _NewSessionDialog({
    required this.date,
    required this.onConfirm,
  });

  final DateTime date;
  final Future<void> Function(String enterpriseId, SessionType type) onConfirm;

  @override
  State<_NewSessionDialog> createState() => _NewSessionDialogState();
}

class _NewSessionDialogState extends State<_NewSessionDialog> {
  final _enterpriseCtrl = TextEditingController();
  SessionType _type = SessionType.initial;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'New Session — ${DateFormat.yMMMd().format(widget.date)}',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _enterpriseCtrl,
            decoration:
                const InputDecoration(labelText: 'Enterprise ID / Name'),
          ),
          const SizedBox(height: AppSpacing.md),
          DropdownButtonFormField<SessionType>(
            value: _type,
            decoration: const InputDecoration(labelText: 'Session Type'),
            items: SessionType.values
                .map(
                  (t) => DropdownMenuItem(
                    value: t,
                    child: Text(t.name),
                  ),
                )
                .toList(),
            onChanged: (v) => setState(() => _type = v!),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _loading
              ? null
              : () async {
                  setState(() => _loading = true);
                  await widget.onConfirm(_enterpriseCtrl.text, _type);
                  setState(() => _loading = false);
                },
          child: _loading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Schedule'),
        ),
      ],
    );
  }
}
