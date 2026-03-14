import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/core/config/router_config.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/common_widgets.dart';
import 'package:intl/intl.dart';

/// Supervisor-specific provider that loads ALL enterprises (no coach filter).
final supervisorEnterprisesProvider =
    FutureProvider<List<Enterprise>>((ref) async {
  return IsarService.enterprises.where().findAll();
});

class SupervisorEnterprisesScreen extends ConsumerWidget {
  const SupervisorEnterprisesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enterprisesAsync = ref.watch(supervisorEnterprisesProvider);

    return Scaffold(
      appBar: const MesmerAppBar(title: 'All Enterprises'),
      body: enterprisesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (list) {
          if (list.isEmpty) {
            return const EmptyStateWidget(
              icon: Icons.business_outlined,
              title: 'No enterprises yet',
              subtitle: 'Coaches have not onboarded any enterprises.',
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: list.length,
            itemBuilder: (_, i) {
              final e = list[i];
              return Card(
                margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    child: Text(
                      e.businessName[0].toUpperCase(),
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  title: Text(e.businessName,
                      style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Owner: ${e.ownerName}'),
                      Text(
                        'Enrolled: ${DateFormat.yMMMd().format(e.enrolledAt)}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  isThreeLine: true,
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Score',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        '${e.baselineBookkeepingScore?.toStringAsFixed(0) ?? '-'}%',
                        style: TextStyle(
                          color: (e.baselineBookkeepingScore ?? 0) > 60
                              ? AppColors.success
                              : AppColors.warning,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => context.push(
                    AppRoutes.progress
                        .replaceAll(':enterpriseId', e.uuid),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
