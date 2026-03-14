import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/features/auth/providers/auth_provider.dart';
import 'package:mesmer_app/shared/models/training_schedule.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/common_widgets.dart';
import 'package:mesmer_app/core/utils/toast_service.dart';

final trainingListProvider =
    FutureProvider.autoDispose<List<TrainingSchedule>>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return [];
  return IsarService.trainings
      .filter()
      .coachIdEqualTo(user.id)
      .sortByScheduledAt()
      .findAll();
});

class TrainingScheduleScreen extends ConsumerWidget {
  const TrainingScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainingsAsync = ref.watch(trainingListProvider);

    return Scaffold(
      appBar: const MesmerAppBar(title: 'Training Schedule'),
      body: trainingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (list) {
          if (list.isEmpty) {
            return EmptyStateWidget(
              icon: Icons.school_outlined,
              title: 'No trainings scheduled',
              subtitle: 'Schedule a training session for your enterprises.',
              action: ElevatedButton.icon(
                onPressed: () => _showAddTrainingSheet(context, ref),
                icon: const Icon(Icons.add),
                label: const Text('Schedule Training'),
              ),
            );
          }

          final upcoming = list.where((t) => !t.isCompleted).toList();
          final completed = list.where((t) => t.isCompleted).toList();

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              if (upcoming.isNotEmpty) ...[
                _SectionLabel(label: 'Upcoming (${upcoming.length})'),
                ...upcoming.map((t) => _TrainingCard(
                      training: t,
                      onComplete: () => _markComplete(ref, t),
                    )),
              ],
              if (completed.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.lg),
                _SectionLabel(label: 'Completed (${completed.length})'),
                ...completed.map((t) => _TrainingCard(
                      training: t,
                      onComplete: null,
                    )),
              ],
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTrainingSheet(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTrainingSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.lg,
          AppSpacing.lg,
          AppSpacing.lg + MediaQuery.of(ctx).viewInsets.bottom,
        ),
        child: _AddTrainingForm(
          onSaved: () {
            Navigator.pop(ctx);
            ref.invalidate(trainingListProvider);
          },
        ),
      ),
    );
  }

  Future<void> _markComplete(WidgetRef ref, TrainingSchedule t) async {
    t.isCompleted = true;
    t.completedAt = DateTime.now();
    t.updatedAt = DateTime.now();
    await IsarService.write((isar) async {
      await isar.trainingSchedules.put(t);
    });
    ref.invalidate(trainingListProvider);
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class _TrainingCard extends StatelessWidget {
  const _TrainingCard({required this.training, this.onComplete});

  final TrainingSchedule training;
  final VoidCallback? onComplete;

  @override
  Widget build(BuildContext context) {
    final isPast = training.scheduledAt.isBefore(DateTime.now());
    final typeColor = _typeColor(training.trainingType);

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: typeColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Text(
                    _typeLabel(training.trainingType),
                    style: TextStyle(
                      color: typeColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                if (training.isCompleted)
                  const Icon(Icons.check_circle, color: AppColors.success, size: 20)
                else if (isPast)
                  const Icon(Icons.warning_amber_rounded,
                      color: AppColors.warning, size: 20),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              training.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    decoration: training.isCompleted
                        ? TextDecoration.lineThrough
                        : null,
                  ),
            ),
            if (training.description != null &&
                training.description!.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(training.description!,
                  style: Theme.of(context).textTheme.bodySmall),
            ],
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  DateFormat.yMMMd().add_jm().format(training.scheduledAt),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: AppSpacing.md),
                Icon(Icons.timer_outlined, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '${training.durationMinutes} min',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            if (training.location != null && training.location!.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.xs),
              Row(
                children: [
                  Icon(Icons.location_on_outlined,
                      size: 14, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(training.location!,
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
            if (onComplete != null) ...[
              const SizedBox(height: AppSpacing.md),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: onComplete,
                  icon: const Icon(Icons.check, size: 16),
                  label: const Text('Mark Complete'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _typeColor(TrainingType type) {
    switch (type) {
      case TrainingType.workshop:
        return AppColors.primary;
      case TrainingType.seminar:
        return AppColors.financeColor;
      case TrainingType.fieldVisit:
        return AppColors.success;
      case TrainingType.groupTraining:
        return AppColors.accent;
      case TrainingType.oneOnOne:
        return AppColors.marketingColor;
      case TrainingType.online:
        return AppColors.info;
      case TrainingType.other:
        return AppColors.textSecondaryLight;
    }
  }

  String _typeLabel(TrainingType type) {
    switch (type) {
      case TrainingType.workshop:
        return 'Workshop';
      case TrainingType.seminar:
        return 'Seminar';
      case TrainingType.fieldVisit:
        return 'Field Visit';
      case TrainingType.groupTraining:
        return 'Group Training';
      case TrainingType.oneOnOne:
        return '1-on-1';
      case TrainingType.online:
        return 'Online';
      case TrainingType.other:
        return 'Other';
    }
  }
}

class _AddTrainingForm extends ConsumerStatefulWidget {
  const _AddTrainingForm({required this.onSaved});
  final VoidCallback onSaved;

  @override
  ConsumerState<_AddTrainingForm> createState() => _AddTrainingFormState();
}

class _AddTrainingFormState extends ConsumerState<_AddTrainingForm> {
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _locationCtrl = TextEditingController();
  final _durationCtrl = TextEditingController(text: '60');
  TrainingType _type = TrainingType.workshop;
  DateTime _scheduledAt = DateTime.now().add(const Duration(days: 1));
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Schedule Training',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: AppSpacing.lg),
          TextFormField(
            controller: _titleCtrl,
            decoration: const InputDecoration(labelText: 'Training Title *'),
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _descCtrl,
            maxLines: 2,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          const SizedBox(height: AppSpacing.md),
          DropdownButtonFormField<TrainingType>(
            value: _type,
            decoration: const InputDecoration(labelText: 'Training Type'),
            items: TrainingType.values
                .map((t) => DropdownMenuItem(
                    value: t,
                    child: Text(t.name[0].toUpperCase() + t.name.substring(1))))
                .toList(),
            onChanged: (v) => setState(() => _type = v!),
          ),
          const SizedBox(height: AppSpacing.md),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Scheduled Date & Time'),
            subtitle:
                Text(DateFormat.yMMMd().add_jm().format(_scheduledAt)),
            trailing: const Icon(Icons.calendar_month),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: _scheduledAt,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (date == null || !mounted) return;
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(_scheduledAt),
              );
              if (time == null || !mounted) return;
              setState(() {
                _scheduledAt = DateTime(
                    date.year, date.month, date.day, time.hour, time.minute);
              });
            },
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _locationCtrl,
            decoration: const InputDecoration(labelText: 'Location'),
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _durationCtrl,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(labelText: 'Duration (minutes)'),
          ),
          const SizedBox(height: AppSpacing.xl),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _saving ? null : _save,
              child: _saving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                  : const Text('Schedule Training'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _save() async {
    if (_titleCtrl.text.trim().isEmpty) {
      ToastService.showError(context, 'Please enter a training title');
      return;
    }

    setState(() => _saving = true);

    final user = ref.read(currentUserProvider);
    final training = TrainingSchedule()
      ..uuid = const Uuid().v4()
      ..coachId = user?.id ?? 'unknown'
      ..enterpriseId = ''
      ..title = _titleCtrl.text.trim()
      ..description = _descCtrl.text.trim()
      ..location = _locationCtrl.text.trim()
      ..trainingType = _type
      ..scheduledAt = _scheduledAt
      ..durationMinutes = int.tryParse(_durationCtrl.text) ?? 60
      ..createdAt = DateTime.now();

    await IsarService.write((isar) async {
      await isar.trainingSchedules.put(training);
    });

    setState(() => _saving = false);
    widget.onSaved();
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _locationCtrl.dispose();
    _durationCtrl.dispose();
    super.dispose();
  }
}
