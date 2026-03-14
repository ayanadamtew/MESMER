import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mesmer_app/features/enterprise/providers/enterprise_provider.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/features/auth/providers/auth_provider.dart';

class SupervisorDashboardScreen extends ConsumerWidget {
  const SupervisorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enterprisesAsync = ref.watch(enterpriseListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Supervisor Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () => ref.read(authNotifierProvider.notifier).signOut(),
          ),
        ],
      ),
      body: enterprisesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (list) {
          final totalSales = list.fold(0.0, (sum, e) => sum + (e.baselineSalesVolume ?? 0));
          final avgBookkeeping = list.isEmpty 
              ? 0.0 
              : list.fold(0.0, (sum, e) => sum + (e.baselineBookkeepingScore ?? 0)) / list.length;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Program Overview',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    _buildStatCard(
                      context,
                      'Enterprises',
                      list.length.toString(),
                      Icons.business_rounded,
                      AppColors.primary,
                    ),
                    const SizedBox(width: AppSpacing.md),
                    _buildStatCard(
                      context,
                      'Avg. Score',
                      '${avgBookkeeping.toStringAsFixed(1)}%',
                      Icons.assessment_rounded,
                      AppColors.accent,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                _buildStatCard(
                  context,
                  'Total Baseline Sales (Monthly)',
                  'GHS ${totalSales.toStringAsFixed(2)}',
                  Icons.trending_up_rounded,
                  AppColors.success,
                ),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  'Active Coaches',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpacing.md),
                _buildCoachTile(context, 'Coach John Doe', '12 Enterprises', 0.8),
                _buildCoachTile(context, 'Coach Sarah Smith', '8 Enterprises', 0.95),
                _buildCoachTile(context, 'Coach David Mensah', '15 Enterprises', 0.6),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: AppSpacing.sm),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: color.withValues(alpha: 0.8),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoachTile(BuildContext context, String name, String stats, double performance) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
          child: Text(name[6], style: const TextStyle(color: AppColors.primary)),
        ),
        title: Text(name),
        subtitle: Text(stats),
        trailing: SizedBox(
          width: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearProgressIndicator(
                value: performance,
                backgroundColor: Colors.grey.shade200,
                color: performance > 0.8 ? AppColors.success : AppColors.warning,
              ),
              const SizedBox(height: 4),
              Text(
                '${(performance * 100).toInt()}%',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
