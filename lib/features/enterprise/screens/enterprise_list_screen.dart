import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mesmer_app/core/config/router_config.dart';
import 'package:mesmer_app/core/network/connectivity_service.dart';
import 'package:mesmer_app/features/auth/providers/auth_provider.dart';
import 'package:mesmer_app/features/enterprise/providers/enterprise_provider.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/common_widgets.dart';
import 'package:mesmer_app/core/utils/toast_service.dart';
import 'package:intl/intl.dart';

class EnterpriseListScreen extends ConsumerStatefulWidget {
  const EnterpriseListScreen({super.key});

  @override
  ConsumerState<EnterpriseListScreen> createState() =>
      _EnterpriseListScreenState();
}

class _EnterpriseListScreenState extends ConsumerState<EnterpriseListScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isOnline = ref.watch(isOnlineProvider);
    final enterprisesAsync = ref.watch(enterpriseListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Enterprises'),
        actions: [
          if (!isOnline)
            const Padding(
              padding: EdgeInsets.only(right: AppSpacing.sm),
              child: Icon(Icons.wifi_off_rounded, color: Colors.orangeAccent),
            ),
          IconButton(
            icon: const Icon(Icons.sync_rounded),
            tooltip: 'Sync pending',
            onPressed: () async {
              await ref
                  .read(enterpriseListProvider.notifier)
                  .syncAllPending();
              if (!context.mounted) return;
              ToastService.showSuccess(context, 'Sync complete');
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert_rounded),
            tooltip: 'Settings',
            onSelected: (value) async {
              if (value == 'logout') {
                await ref.read(authNotifierProvider.notifier).signOut();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout_rounded, size: 20),
                    SizedBox(width: AppSpacing.sm),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          if (!isOnline) const OfflineBanner(),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search enterprises…',
                prefixIcon: Icon(Icons.search_rounded),
              ),
              onChanged: (v) => setState(() => _searchQuery = v.toLowerCase()),
            ),
          ),
          Expanded(
            child: enterprisesAsync.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (list) {
                final filtered = _searchQuery.isEmpty
                    ? list
                    : list
                        .where(
                          (e) =>
                              e.businessName
                                  .toLowerCase()
                                  .contains(_searchQuery) ||
                              e.ownerName
                                  .toLowerCase()
                                  .contains(_searchQuery) ||
                              (e.city ?? '')
                                  .toLowerCase()
                                  .contains(_searchQuery),
                        )
                        .toList();

                if (filtered.isEmpty) {
                  return EmptyStateWidget(
                    icon: Icons.business_outlined,
                    title: 'No enterprises yet',
                    subtitle:
                        'Tap the + button to onboard your first enterprise.',
                    action: ElevatedButton.icon(
                      onPressed: () =>
                          context.push(AppRoutes.enterpriseOnboarding),
                      icon: const Icon(Icons.add),
                      label: const Text('Add Enterprise'),
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => ref.refresh(enterpriseListProvider.future),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    itemCount: filtered.length,
                    itemBuilder: (_, idx) =>
                        _EnterpriseCard(enterprise: filtered[idx]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(AppRoutes.enterpriseOnboarding),
        icon: const Icon(Icons.add_business_rounded),
        label: const Text('New Enterprise'),
      ),
    );
  }
}

class _EnterpriseCard extends StatelessWidget {
  const _EnterpriseCard({required this.enterprise});

  final Enterprise enterprise;

  @override
  Widget build(BuildContext context) {
    final sectorColor = _sectorColor(enterprise.sector);

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        onTap: () {
          context.push(
            AppRoutes.diagnosis.replaceAll(':enterpriseId', enterprise.uuid),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: sectorColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Icon(
                  _sectorIcon(enterprise.sector),
                  color: sectorColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      enterprise.businessName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${enterprise.ownerName} · ${enterprise.city ?? 'Unknown location'}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        StatusChip(
                          label: enterprise.sector.name,
                          color: sectorColor,
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        if (!enterprise.isSynced)
                          StatusChip(
                            label: 'Pending sync',
                            color: AppColors.warning,
                            icon: Icons.cloud_upload_outlined,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert_rounded, size: 20, color: AppColors.textSecondaryLight),
                    padding: EdgeInsets.zero,
                    onSelected: (val) {
                      if (val == 'edit') {
                        context.push(AppRoutes.enterpriseEdit, extra: enterprise);
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit_outlined, size: 18),
                            SizedBox(width: AppSpacing.sm),
                            Text('Edit Profile'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('MMM d').format(enterprise.enrolledAt),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _sectorColor(BusinessSector s) {
    switch (s) {
      case BusinessSector.agriculture:
        return const Color(0xFF22C55E);
      case BusinessSector.manufacturing:
        return AppColors.operationsColor;
      case BusinessSector.trade:
        return AppColors.accent;
      case BusinessSector.services:
        return AppColors.primary;
      case BusinessSector.technology:
        return AppColors.info;
      case BusinessSector.healthcare:
        return AppColors.error;
      case BusinessSector.education:
        return AppColors.governanceColor;
      default:
        return AppColors.textSecondaryLight;
    }
  }

  IconData _sectorIcon(BusinessSector s) {
    switch (s) {
      case BusinessSector.agriculture:
        return Icons.eco_rounded;
      case BusinessSector.manufacturing:
        return Icons.factory_rounded;
      case BusinessSector.trade:
        return Icons.storefront_rounded;
      case BusinessSector.services:
        return Icons.miscellaneous_services_rounded;
      case BusinessSector.technology:
        return Icons.computer_rounded;
      case BusinessSector.healthcare:
        return Icons.local_hospital_rounded;
      case BusinessSector.education:
        return Icons.school_rounded;
      case BusinessSector.construction:
        return Icons.construction_rounded;
      default:
        return Icons.business_rounded;
    }
  }
}
