import 'package:isar/isar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/features/enterprise/providers/enterprise_provider.dart';
import 'package:mesmer_app/features/reports/services/report_generator.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/common_widgets.dart';
import 'package:mesmer_app/shared/widgets/loading_overlay.dart';
import 'package:mesmer_app/core/utils/toast_service.dart';
import 'package:intl/intl.dart';

class ReportsScreen extends ConsumerStatefulWidget {
  const ReportsScreen({super.key});

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen> {
  bool _isLoading = false;

  Future<void> _generateReport(Enterprise enterprise) async {
    setState(() => _isLoading = true);
    try {
      final generator = ref.read(reportGeneratorProvider);
      await generator.generateEnterpriseReport(
        context: context,
        enterprise: enterprise,
      );
    } catch (e) {
      if (!mounted) return;
      ToastService.showError(context, 'Report generation failed: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final enterprisesAsync = ref.watch(enterpriseListProvider);

    return LoadingOverlay(
      isLoading: _isLoading,
      message: 'Generating PDF report…',
      child: Scaffold(
        appBar: const MesmerAppBar(title: 'Reports'),
        body: enterprisesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
          data: (list) {
            if (list.isEmpty) {
              return const EmptyStateWidget(
                icon: Icons.description_outlined,
                title: 'No enterprises to report on',
                subtitle: 'Onboard enterprises first to generate reports.',
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
                    leading: const CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        Icons.business_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    title: Text(e.businessName,
                        style: Theme.of(context).textTheme.titleMedium),
                    subtitle: Text(
                        'Enrolled: ${DateFormat.yMMMd().format(e.enrolledAt)}'),
                    trailing: ElevatedButton.icon(
                      onPressed: () => _generateReport(e),
                      icon: const Icon(Icons.picture_as_pdf_rounded, size: 16),
                      label: const Text('PDF'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.sm,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
