import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mesmer_app/features/enterprise_portal/providers/linked_enterprise_provider.dart';
import 'package:mesmer_app/features/auth/providers/auth_provider.dart';
import 'package:mesmer_app/core/config/router_config.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/features/progress/screens/progress_dashboard_screen.dart';

class EnterpriseDashboardScreen extends ConsumerWidget {
  const EnterpriseDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enterpriseAsync = ref.watch(linkedEnterpriseProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Business Growth'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () => ref.read(authNotifierProvider.notifier).signOut(),
          ),
        ],
      ),
      body: enterpriseAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (enterprise) {
          if (enterprise == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.business_center_outlined, size: 64, color: AppColors.primary),
                    SizedBox(height: AppSpacing.md),
                    Text(
                      'No Enterprise Assigned',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: AppSpacing.sm),
                    Text(
                      'We couldn\'t automatically find a business linked to your email.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.textSecondaryLight),
                    ),
                    SizedBox(height: AppSpacing.xl),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => context.push(AppRoutes.enterpriseLink),
                        icon: const Icon(Icons.link_rounded),
                        label: const Text('Link Business Manually'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWelcomeHeader(context, enterprise.businessName),
                const SizedBox(height: AppSpacing.xl),
                
                // Progress Overview
                Text('Performance Overview', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: AppSpacing.md),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    border: Border.all(color: Theme.of(context).dividerColor),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    child: ProgressDashboardScreen(enterpriseId: enterprise.uuid, isEmbedded: true),
                  ),
                ),
                
                const SizedBox(height: AppSpacing.xl),
                Text('Support & Communication', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: AppSpacing.md),
                ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.chat_bubble_outline)),
                  title: const Text('Contact My Coach'),
                  subtitle: const Text('Ask a question or request follow-up'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.go(AppRoutes.enterpriseMessages),
                ),
                const Divider(),
                ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.description_outlined)),
                  title: const Text('View Recommendations'),
                  subtitle: const Text('See latest tips from your coach'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.go(AppRoutes.enterpriseRecommendations),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildWelcomeHeader(BuildContext context, String businessName) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primary.withValues(alpha: 0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome Back,',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          Text(
            businessName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'Keep up the great work! Your bookkeeping score improved by 5% this week.',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
