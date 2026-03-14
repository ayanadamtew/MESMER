import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:isar/isar.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';
import 'package:mesmer_app/shared/models/coaching_session.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/common_widgets.dart';

class SupervisorReportsScreen extends ConsumerWidget {
  const SupervisorReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MesmerAppBar(title: 'Program Analytics'),
      body: FutureBuilder<_ProgramStats>(
        future: _loadStats(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final stats = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Program Overview',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: AppSpacing.md),

                // Stat cards row
                Row(
                  children: [
                    _StatCard(
                      label: 'Total Enterprises',
                      value: stats.totalEnterprises.toString(),
                      icon: Icons.business_rounded,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    _StatCard(
                      label: 'Total Sessions',
                      value: stats.totalSessions.toString(),
                      icon: Icons.event_rounded,
                      color: AppColors.accent,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    _StatCard(
                      label: 'Completed',
                      value: stats.completedSessions.toString(),
                      icon: Icons.check_circle_outline,
                      color: AppColors.success,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),

                // Avg bookkeeping
                _buildInfoCard(
                  context,
                  'Avg Bookkeeping Score',
                  '${stats.avgBookkeeping.toStringAsFixed(1)}%',
                  Icons.book_outlined,
                  AppColors.financeColor,
                ),
                const SizedBox(height: AppSpacing.md),

                _buildInfoCard(
                  context,
                  'Total Baseline Sales',
                  'GHS ${stats.totalSales.toStringAsFixed(0)}',
                  Icons.trending_up_rounded,
                  AppColors.success,
                ),
                const SizedBox(height: AppSpacing.xl),

                // Sector distribution
                Text('Enterprise Sectors',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: AppSpacing.md),
                if (stats.sectorCounts.isNotEmpty)
                  SizedBox(
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        sections: _buildSectorSections(stats.sectorCounts),
                        centerSpaceRadius: 40,
                        sectionsSpace: 2,
                      ),
                    ),
                  ),
                const SizedBox(height: AppSpacing.md),

                // Sector legend
                Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.xs,
                  children: stats.sectorCounts.entries.map((e) {
                    final idx =
                        stats.sectorCounts.keys.toList().indexOf(e.key);
                    return _LegendItem(
                      label: '${e.key.name} (${e.value})',
                      color: AppColors.chartPalette[
                          idx % AppColors.chartPalette.length],
                    );
                  }).toList(),
                ),
                const SizedBox(height: AppSpacing.xl),

                // Struggling enterprises
                Text('Struggling Enterprises',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Enterprises with bookkeeping scores below 40%',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: AppSpacing.md),
                if (stats.strugglingEnterprises.isEmpty)
                  const EmptyStateWidget(
                    icon: Icons.celebration_outlined,
                    title: 'All enterprises are on track!',
                    subtitle: 'No enterprises with critically low scores.',
                  )
                else
                  ...stats.strugglingEnterprises.map(
                    (e) => Card(
                      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              AppColors.error.withValues(alpha: 0.1),
                          child: const Icon(Icons.warning_amber_rounded,
                              color: AppColors.error),
                        ),
                        title: Text(e.businessName),
                        subtitle: Text('Owner: ${e.ownerName}'),
                        trailing: Text(
                          '${e.baselineBookkeepingScore?.toStringAsFixed(0) ?? '0'}%',
                          style: const TextStyle(
                            color: AppColors.error,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<_ProgramStats> _loadStats() async {
    final enterprises = await IsarService.enterprises.where().findAll();
    final sessions = await IsarService.sessions.where().findAll();

    final totalSales =
        enterprises.fold(0.0, (sum, e) => sum + (e.baselineSalesVolume ?? 0));
    final avgBookkeeping = enterprises.isEmpty
        ? 0.0
        : enterprises.fold(
                0.0, (sum, e) => sum + (e.baselineBookkeepingScore ?? 0)) /
            enterprises.length;

    final sectorCounts = <BusinessSector, int>{};
    for (final e in enterprises) {
      sectorCounts[e.sector] = (sectorCounts[e.sector] ?? 0) + 1;
    }

    final struggling = enterprises
        .where((e) => (e.baselineBookkeepingScore ?? 0) < 40)
        .toList();

    final completed =
        sessions.where((s) => s.status == SessionStatus.completed).length;

    return _ProgramStats(
      totalEnterprises: enterprises.length,
      totalSessions: sessions.length,
      completedSessions: completed,
      totalSales: totalSales,
      avgBookkeeping: avgBookkeeping,
      sectorCounts: sectorCounts,
      strugglingEnterprises: struggling,
    );
  }

  List<PieChartSectionData> _buildSectorSections(
      Map<BusinessSector, int> counts) {
    final total = counts.values.fold(0, (a, b) => a + b);
    return counts.entries.map((e) {
      final idx = counts.keys.toList().indexOf(e.key);
      final percentage = (e.value / total * 100);
      return PieChartSectionData(
        value: e.value.toDouble(),
        color: AppColors.chartPalette[idx % AppColors.chartPalette.length],
        title: '${percentage.toStringAsFixed(0)}%',
        titleStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        radius: 50,
      );
    }).toList();
  }

  Widget _buildInfoCard(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(width: AppSpacing.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: Theme.of(context).textTheme.labelMedium),
              Text(
                value,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProgramStats {
  final int totalEnterprises;
  final int totalSessions;
  final int completedSessions;
  final double totalSales;
  final double avgBookkeeping;
  final Map<BusinessSector, int> sectorCounts;
  final List<Enterprise> strugglingEnterprises;

  _ProgramStats({
    required this.totalEnterprises,
    required this.totalSessions,
    required this.completedSessions,
    required this.totalSales,
    required this.avgBookkeeping,
    required this.sectorCounts,
    required this.strugglingEnterprises,
  });
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: AppSpacing.xs),
              Text(
                value,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
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

class _LegendItem extends StatelessWidget {
  const _LegendItem({required this.label, required this.color});

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
