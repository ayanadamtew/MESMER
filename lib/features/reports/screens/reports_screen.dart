import 'package:isar/isar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/features/reports/services/report_generator.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/common_widgets.dart';
import 'package:mesmer_app/shared/widgets/loading_overlay.dart';
import 'package:intl/intl.dart';

class ReportsScreen extends ConsumerStatefulWidget {
  const ReportsScreen({super.key});

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen> {
  List<Enterprise> _enterprises = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadEnterprises();
  }

  Future<void> _loadEnterprises() async {
    final list = await IsarService.enterprises.where().findAll();
    if (mounted) setState(() => _enterprises = list);
  }

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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Report generation failed: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      message: 'Generating PDF report…',
      child: Scaffold(
        appBar: const MesmerAppBar(title: 'Reports'),
        body: _enterprises.isEmpty
            ? const EmptyStateWidget(
                icon: Icons.description_outlined,
                title: 'No enterprises to report on',
                subtitle: 'Onboard enterprises first to generate reports.',
              )
            : ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.md),
                itemCount: _enterprises.length,
                itemBuilder: (_, i) {
                  final e = _enterprises[i];
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
              ),
      ),
    );
  }
}
