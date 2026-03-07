import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mesmer_app/features/diagnosis/services/checklist_data.dart';
import 'package:mesmer_app/features/diagnosis/services/priority_algorithm.dart';
import 'package:mesmer_app/features/diagnosis/providers/diagnosis_provider.dart';
import 'package:mesmer_app/shared/models/diagnosis_assessment.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/common_widgets.dart';

class DiagnosisScreen extends ConsumerStatefulWidget {
  const DiagnosisScreen({required this.enterpriseId, super.key});

  final String enterpriseId;

  @override
  ConsumerState<DiagnosisScreen> createState() => _DiagnosisScreenState();
}

class _DiagnosisScreenState extends ConsumerState<DiagnosisScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Map of checklistItem.id → bool? (true=yes, false=no, null=unanswered)
  final Map<String, bool?> _answers = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: DiagnosisCategory.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<ChecklistItem> _itemsFor(DiagnosisCategory cat) =>
      ChecklistData.allItems.where((i) => i.category == cat).toList();

  double _scoreFor(DiagnosisCategory cat) {
    final items = _itemsFor(cat);
    if (items.isEmpty) return 0;
    double totalWeight = 0;
    double earnedWeight = 0;
    for (final item in items) {
      totalWeight += item.weight;
      if (_answers[item.id] == true) earnedWeight += item.weight;
    }
    return totalWeight == 0 ? 0 : (earnedWeight / totalWeight) * 100;
  }

  Future<void> _saveAssessment() async {
    final notifier = ref.read(diagnosisProvider(widget.enterpriseId).notifier);
    await notifier.saveAssessment(
      enterpriseId: widget.enterpriseId,
      financeScore: _scoreFor(DiagnosisCategory.finance),
      marketingScore: _scoreFor(DiagnosisCategory.marketing),
      hrScore: _scoreFor(DiagnosisCategory.hr),
      operationsScore: _scoreFor(DiagnosisCategory.operations),
      governanceScore: _scoreFor(DiagnosisCategory.governance),
      answers: _answers,
    );

    if (!mounted) return;
    final priorities = PriorityAlgorithm.compute(
      finance: _scoreFor(DiagnosisCategory.finance),
      marketing: _scoreFor(DiagnosisCategory.marketing),
      hr: _scoreFor(DiagnosisCategory.hr),
      operations: _scoreFor(DiagnosisCategory.operations),
      governance: _scoreFor(DiagnosisCategory.governance),
    );

    _showResultsBottomSheet(priorities);
  }

  void _showResultsBottomSheet(List<PriorityChallenge> priorities) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        expand: false,
        builder: (_, controller) => ListView(
          controller: controller,
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(ctx).dividerColor,
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Diagnosis Results',
              style: Theme.of(ctx).textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Priority business challenges identified:',
              style: Theme.of(ctx).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(ctx)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.6),
                  ),
            ),
            const SizedBox(height: AppSpacing.lg),
            ...priorities.asMap().entries.map(
                  (entry) => _PriorityCard(
                    rank: entry.key + 1,
                    challenge: entry.value,
                  ),
                ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx);
                context.pop();
              },
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Diagnosis'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: DiagnosisCategory.values
              .map(
                (cat) => Tab(
                  text: _categoryLabel(cat),
                  icon: Icon(_categoryIcon(cat), size: 18),
                ),
              )
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: DiagnosisCategory.values
            .map(
              (cat) => _ChecklistTab(
                category: cat,
                items: _itemsFor(cat),
                answers: _answers,
                onAnswerChanged: (id, val) =>
                    setState(() => _answers[id] = val),
                score: _scoreFor(cat),
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: ElevatedButton.icon(
            onPressed: _saveAssessment,
            icon: const Icon(Icons.check_circle_outline),
            label: const Text('Complete Diagnosis'),
          ),
        ),
      ),
    );
  }

  String _categoryLabel(DiagnosisCategory c) {
    switch (c) {
      case DiagnosisCategory.finance:
        return 'Finance';
      case DiagnosisCategory.marketing:
        return 'Marketing';
      case DiagnosisCategory.hr:
        return 'HR';
      case DiagnosisCategory.operations:
        return 'Operations';
      case DiagnosisCategory.governance:
        return 'Governance';
    }
  }

  IconData _categoryIcon(DiagnosisCategory c) {
    switch (c) {
      case DiagnosisCategory.finance:
        return Icons.account_balance_wallet_outlined;
      case DiagnosisCategory.marketing:
        return Icons.campaign_outlined;
      case DiagnosisCategory.hr:
        return Icons.people_outlined;
      case DiagnosisCategory.operations:
        return Icons.settings_outlined;
      case DiagnosisCategory.governance:
        return Icons.gavel_outlined;
    }
  }
}

class _ChecklistTab extends StatelessWidget {
  const _ChecklistTab({
    required this.category,
    required this.items,
    required this.answers,
    required this.onAnswerChanged,
    required this.score,
  });

  final DiagnosisCategory category;
  final List<ChecklistItem> items;
  final Map<String, bool?> answers;
  final void Function(String id, bool? val) onAnswerChanged;
  final double score;

  @override
  Widget build(BuildContext context) {
    final catColor = _catColor();
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        // Score summary bar
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: catColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: catColor.withValues(alpha: 0.2)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Score',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.full),
                      child: LinearProgressIndicator(
                        value: score / 100,
                        minHeight: 8,
                        backgroundColor: catColor.withValues(alpha: 0.15),
                        valueColor: AlwaysStoppedAnimation(catColor),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Text(
                '${score.toStringAsFixed(0)}%',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: catColor,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        ...items.map(
          (item) => _ChecklistItemTile(
            item: item,
            answer: answers[item.id],
            onChanged: (val) => onAnswerChanged(item.id, val),
          ),
        ),
      ],
    );
  }

  Color _catColor() {
    switch (category) {
      case DiagnosisCategory.finance:
        return AppColors.financeColor;
      case DiagnosisCategory.marketing:
        return AppColors.marketingColor;
      case DiagnosisCategory.hr:
        return AppColors.hrColor;
      case DiagnosisCategory.operations:
        return AppColors.operationsColor;
      case DiagnosisCategory.governance:
        return AppColors.governanceColor;
    }
  }
}

class _ChecklistItemTile extends StatelessWidget {
  const _ChecklistItemTile({
    required this.item,
    required this.answer,
    required this.onChanged,
  });

  final ChecklistItem item;
  final bool? answer;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.question,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                _AnswerButton(
                  label: 'Yes',
                  selected: answer == true,
                  color: AppColors.success,
                  onTap: () => onChanged(answer == true ? null : true),
                ),
                const SizedBox(width: AppSpacing.sm),
                _AnswerButton(
                  label: 'No',
                  selected: answer == false,
                  color: AppColors.error,
                  onTap: () => onChanged(answer == false ? null : false),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AnswerButton extends StatelessWidget {
  const _AnswerButton({
    required this.label,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: selected ? color : color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: color.withValues(alpha: 0.4)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : color,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

class _PriorityCard extends StatelessWidget {
  const _PriorityCard({required this.rank, required this.challenge});

  final int rank;
  final PriorityChallenge challenge;

  @override
  Widget build(BuildContext context) {
    final color = _severityColor(challenge.severity);
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Text(
            '#$rank',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ),
        title: Text(challenge.category,
            style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(challenge.description),
        trailing: StatusChip(
          label: challenge.severity.name,
          color: color,
        ),
      ),
    );
  }

  Color _severityColor(ChallengeSeverity s) {
    switch (s) {
      case ChallengeSeverity.critical:
        return AppColors.error;
      case ChallengeSeverity.high:
        return AppColors.warning;
      case ChallengeSeverity.medium:
        return AppColors.info;
      case ChallengeSeverity.low:
        return AppColors.success;
    }
  }
}
