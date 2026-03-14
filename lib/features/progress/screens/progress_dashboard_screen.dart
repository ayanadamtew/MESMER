import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:mesmer_app/features/progress/providers/progress_provider.dart';
import 'package:mesmer_app/shared/models/progress_indicator_record.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/common_widgets.dart';

class ProgressDashboardScreen extends ConsumerWidget {
  const ProgressDashboardScreen({
    required this.enterpriseId,
    this.isEmbedded = false,
    super.key,
  });

  final String enterpriseId;
  final bool isEmbedded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordsAsync = ref.watch(progressProvider(enterpriseId));

    final content = recordsAsync.when(
        loading: () => const Center(child: Padding(padding: EdgeInsets.all(AppSpacing.xl), child: CircularProgressIndicator())),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (records) {
          if (records.isEmpty) {
            return Center(
              child: SingleChildScrollView(
                physics: isEmbedded ? const NeverScrollableScrollPhysics() : null,
                child: EmptyStateWidget(
                  icon: Icons.insights_outlined,
                  title: 'No progress data yet',
                  subtitle:
                      'Add a progress record to start tracking enterprise growth.',
                  action: isEmbedded ? null : ElevatedButton.icon(
                    onPressed: () => _showAddProgressDialog(context, ref),
                    icon: const Icon(Icons.add),
                    label: const Text('Add Record'),
                  ),
                ),
              ),
            );
          }

          final sorted = [...records]
            ..sort((a, b) => a.recordedAt.compareTo(b.recordedAt));

          final baseline = sorted.first;
          final latest = sorted.last;

          return SingleChildScrollView(
            physics: isEmbedded ? const NeverScrollableScrollPhysics() : null,
            padding: EdgeInsets.all(isEmbedded ? 0 : AppSpacing.md),
            child: Column(
              children: [
                // Summary cards
                _SummaryRow(baseline: baseline, latest: latest),
                const SizedBox(height: AppSpacing.lg),
                // Bookkeeping chart
                _ChartCard(
                  title: 'Bookkeeping Score',
                  color: AppColors.financeColor,
                  spots: sorted
                      .where((r) => r.bookkeepingScore != null)
                      .toList()
                      .asMap()
                      .entries
                      .map(
                        (e) => FlSpot(
                          e.key.toDouble(),
                          e.value.bookkeepingScore!,
                        ),
                      )
                      .toList(),
                  yLabel: 'Score',
                  maxY: 100,
                ),
                const SizedBox(height: AppSpacing.md),
                // Sales growth chart
                _ChartCard(
                  title: 'Sales Volume (GHS)',
                  color: AppColors.primary,
                  spots: sorted
                      .where((r) => r.salesVolume != null)
                      .toList()
                      .asMap()
                      .entries
                      .map(
                        (e) => FlSpot(
                          e.key.toDouble(),
                          e.value.salesVolume!,
                        ),
                      )
                      .toList(),
                  yLabel: 'GHS',
                  maxY: null,
                ),
                const SizedBox(height: AppSpacing.md),
                // Loan repayment bar chart
                _LoanRepaymentChart(records: sorted),
                const SizedBox(height: AppSpacing.xl),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => _showAddProgressDialog(context, ref),
                    icon: const Icon(Icons.add),
                    label: const Text('Add Progress Record'),
                  ),
                ),
              ],
            ),
          );
        },
      );

    if (isEmbedded) {
      return content;
    }

    return Scaffold(
      appBar: const MesmerAppBar(title: 'Progress Dashboard'),
      body: content,
    );
  }

  void _showAddProgressDialog(BuildContext context, WidgetRef ref) {
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
        child: _AddProgressForm(
          enterpriseId: enterpriseId,
          onSaved: () {
            Navigator.pop(ctx);
            ref.invalidate(progressProvider(enterpriseId));
          },
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.baseline, required this.latest});

  final ProgressIndicatorRecord baseline;
  final ProgressIndicatorRecord latest;

  @override
  Widget build(BuildContext context) {
    final bookkeepingGrowth = baseline.bookkeepingScore != null &&
            latest.bookkeepingScore != null
        ? latest.bookkeepingScore! - baseline.bookkeepingScore!
        : null;

    final salesGrowth =
        baseline.salesVolume != null && latest.salesVolume != null
            ? ((latest.salesVolume! - baseline.salesVolume!) /
                    baseline.salesVolume! *
                    100)
            : null;

    return Row(
      children: [
        _StatCard(
          label: 'Bookkeeping',
          value: bookkeepingGrowth != null
              ? '${bookkeepingGrowth >= 0 ? '+' : ''}${bookkeepingGrowth.toStringAsFixed(0)} pts'
              : 'N/A',
          icon: Icons.book_outlined,
          color: AppColors.financeColor,
          isPositive: bookkeepingGrowth != null && bookkeepingGrowth >= 0,
        ),
        const SizedBox(width: AppSpacing.sm),
        _StatCard(
          label: 'Sales Growth',
          value:
              salesGrowth != null ? '${salesGrowth.toStringAsFixed(1)}%' : 'N/A',
          icon: Icons.trending_up_rounded,
          color: AppColors.primary,
          isPositive: salesGrowth != null && salesGrowth >= 0,
        ),
        const SizedBox(width: AppSpacing.sm),
        _StatCard(
          label: 'Loan Status',
          value: latest.loanRepaymentStatus.name,
          icon: Icons.account_balance_outlined,
          color: _loanColor(latest.loanRepaymentStatus),
          isPositive:
              latest.loanRepaymentStatus == LoanRepaymentStatus.onTrack,
        ),
      ],
    );
  }

  Color _loanColor(LoanRepaymentStatus s) {
    switch (s) {
      case LoanRepaymentStatus.onTrack:
        return AppColors.success;
      case LoanRepaymentStatus.delayed:
        return AppColors.warning;
      case LoanRepaymentStatus.defaulted:
        return AppColors.error;
      case LoanRepaymentStatus.nLoan:
        return AppColors.info;
    }
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    required this.isPositive,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            children: [
              Icon(icon, color: color, size: 22),
              const SizedBox(height: AppSpacing.xs),
              Text(
                value,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w700,
                    ),
                textAlign: TextAlign.center,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChartCard extends StatelessWidget {
  const _ChartCard({
    required this.title,
    required this.color,
    required this.spots,
    required this.yLabel,
    this.maxY,
  });

  final String title;
  final Color color;
  final List<FlSpot> spots;
  final String yLabel;
  final double? maxY;

  @override
  Widget build(BuildContext context) {
    if (spots.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.md),
            SizedBox(
              height: 160,
              child: LineChart(
                LineChartData(
                  maxY: maxY,
                  minY: 0,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (_) => FlLine(
                      color: Theme.of(context).dividerColor,
                      strokeWidth: 1,
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: color,
                      barWidth: 3,
                      belowBarData: BarAreaData(
                        show: true,
                        color: color.withValues(alpha: 0.12),
                      ),
                      dotData: FlDotData(
                        getDotPainter: (spot, _, __, ___) =>
                            FlDotCirclePainter(
                          radius: 4,
                          color: color,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoanRepaymentChart extends StatelessWidget {
  const _LoanRepaymentChart({required this.records});

  final List<ProgressIndicatorRecord> records;

  @override
  Widget build(BuildContext context) {
    final groups = records.asMap().entries.map((e) {
      final status = e.value.loanRepaymentStatus;
      final color = switch (status) {
        LoanRepaymentStatus.onTrack => AppColors.success,
        LoanRepaymentStatus.delayed => AppColors.warning,
        LoanRepaymentStatus.defaulted => AppColors.error,
        LoanRepaymentStatus.nLoan => AppColors.info,
      };
      return BarChartGroupData(
        x: e.key,
        barRods: [
          BarChartRodData(
            toY: status == LoanRepaymentStatus.onTrack
                ? 3
                : status == LoanRepaymentStatus.delayed
                    ? 2
                    : status == LoanRepaymentStatus.defaulted
                        ? 1
                        : 0,
            color: color,
            width: 16,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    }).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Loan Repayment Trend',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.md),
            SizedBox(
              height: 120,
              child: BarChart(
                BarChartData(
                  barGroups: groups,
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(
                    leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                  maxY: 3,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.md,
              children: const [
                _Legend(label: 'On Track', color: AppColors.success),
                _Legend(label: 'Delayed', color: AppColors.warning),
                _Legend(label: 'Defaulted', color: AppColors.error),
                _Legend(label: 'No Loan', color: AppColors.info),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class _AddProgressForm extends ConsumerStatefulWidget {
  const _AddProgressForm({
    required this.enterpriseId,
    required this.onSaved,
  });

  final String enterpriseId;
  final VoidCallback onSaved;

  @override
  ConsumerState<_AddProgressForm> createState() => _AddProgressFormState();
}

class _AddProgressFormState extends ConsumerState<_AddProgressForm> {
  final _bookkeepingCtrl = TextEditingController();
  final _salesCtrl = TextEditingController();
  LoanRepaymentStatus _loanStatus = LoanRepaymentStatus.onTrack;
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Add Progress Record',
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: AppSpacing.lg),
        TextFormField(
          controller: _bookkeepingCtrl,
          keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Bookkeeping Score (0–100)',
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        TextFormField(
          controller: _salesCtrl,
          keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
          decoration:
              const InputDecoration(labelText: 'Sales Volume (GHS)'),
        ),
        const SizedBox(height: AppSpacing.md),
        DropdownButtonFormField<LoanRepaymentStatus>(
          value: _loanStatus,
          decoration:
              const InputDecoration(labelText: 'Loan Repayment Status'),
          items: LoanRepaymentStatus.values
              .map(
                (s) => DropdownMenuItem(value: s, child: Text(s.name)),
              )
              .toList(),
          onChanged: (v) => setState(() => _loanStatus = v!),
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
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text('Save Record'),
          ),
        ),
      ],
    );
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    await ref.read(progressProvider(widget.enterpriseId).notifier).addRecord(
          enterpriseId: widget.enterpriseId,
          bookkeepingScore: double.tryParse(_bookkeepingCtrl.text),
          salesVolume: double.tryParse(_salesCtrl.text),
          loanStatus: _loanStatus,
        );
    setState(() => _saving = false);
    widget.onSaved();
  }
}
