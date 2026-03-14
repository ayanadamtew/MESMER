import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mesmer_app/features/auth/providers/auth_provider.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/common_widgets.dart';
import 'package:mesmer_app/features/enterprise/providers/enterprise_provider.dart';
import 'package:mesmer_app/features/enterprise_portal/providers/linked_enterprise_provider.dart';
import 'package:mesmer_app/shared/models/app_user.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final email = user?.email ?? 'Unknown';
    final role = user?.userMetadata?['role'] as String? ?? 'coach';
    final roleLabel = _roleName(role);
    final roleColor = _roleColor(role);

    return Scaffold(
      appBar: const MesmerAppBar(title: 'Profile & Settings'),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          // ─── Profile Card ───
          Container(
            padding: const EdgeInsets.all(AppSpacing.xl),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [roleColor, roleColor.withValues(alpha: 0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppRadius.xl),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white.withValues(alpha: 0.2),
                  child: Text(
                    email[0].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  email,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(AppRadius.xl),
                  ),
                  child: Text(
                    roleLabel,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // ─── Account Section ───
          _SectionHeader(title: 'Account'),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.email_outlined),
                  title: const Text('Email'),
                  subtitle: Text(email),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.badge_outlined),
                  title: const Text('Role'),
                  subtitle: Text(roleLabel),
                  trailing: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: roleColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.lock_outline),
                  title: const Text('Change Password'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // ─── Relationships Section ───
          if (role == 'enterprise') ...[
            _SectionHeader(title: 'My Business Coach'),
            _CoachSection(),
            const SizedBox(height: AppSpacing.lg),
          ] else if (role == 'coach') ...[
            _SectionHeader(title: 'My Portfolio'),
            _CoachPortfolioSection(),
            const SizedBox(height: AppSpacing.lg),
          ],

          // ─── App Settings ───
          _SectionHeader(title: 'App Settings'),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.notifications_outlined),
                  title: const Text('Push Notifications'),
                  trailing: Switch(value: true, onChanged: (_) {}),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.dark_mode_outlined),
                  title: const Text('Dark Mode'),
                  trailing: Switch(
                    value: Theme.of(context).brightness == Brightness.dark,
                    onChanged: (_) {},
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.language_outlined),
                  title: const Text('Language'),
                  subtitle: const Text('English'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // ─── Data & Storage ───
          _SectionHeader(title: 'Data & Storage'),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.sync_outlined),
                  title: const Text('Sync Status'),
                  subtitle: const Text('Last synced: Just now'),
                  trailing: IconButton(
                    icon: const Icon(Icons.refresh_outlined),
                    onPressed: () {},
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.storage_outlined),
                  title: const Text('Clear Local Cache'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // ─── About ───
          _SectionHeader(title: 'About'),
          Card(
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('MESMER Platform'),
                  subtitle: Text('Version 1.0.0'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.description_outlined),
                  title: const Text('Terms of Service'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text('Privacy Policy'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // ─── Sign Out ───
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () =>
                  ref.read(authNotifierProvider.notifier).signOut(),
              icon: const Icon(Icons.logout_rounded),
              label: const Text('Sign Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  String _roleName(String role) {
    switch (role) {
      case 'supervisor':
        return '📊 Supervisor / Program Manager';
      case 'enterprise':
        return '🏢 Enterprise Owner';
      case 'admin':
        return '⚙️ System Administrator';
      default:
        return '🧑‍💼 Business Coach';
    }
  }

  Color _roleColor(String role) {
    switch (role) {
      case 'supervisor':
        return AppColors.financeColor;
      case 'enterprise':
        return AppColors.accent;
      case 'admin':
        return AppColors.governanceColor;
      default:
        return AppColors.primary;
    }
  }
}

class _CoachSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final linkedEnterpriseAsync = ref.watch(linkedEnterpriseProvider);

    return linkedEnterpriseAsync.when(
      data: (enterprise) {
        if (enterprise == null || enterprise.coachId == null) {
          return const Card(
            child: ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('No coach assigned yet'),
            ),
          );
        }

        final coachAsync = ref.watch(appUserProvider(enterprise.coachId!));

        return coachAsync.when(
          data: (coach) => Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                child: const Icon(Icons.person, color: AppColors.primary),
              ),
              title: Text(coach?.name ?? 'Assigned Coach'),
              subtitle: Text(coach?.email ?? 'Contact info unavailable'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Future: Navigate to coach info or chat
              },
            ),
          ),
          loading: () => const Center(child: LinearProgressIndicator()),
          error: (_, __) => const Text('Error loading coach details'),
        );
      },
      loading: () => const Center(child: LinearProgressIndicator()),
      error: (_, __) => const Text('Error loading enterprise details'),
    );
  }
}

class _CoachPortfolioSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enterprisesAsync = ref.watch(enterpriseListProvider);

    return enterprisesAsync.when(
      data: (enterprises) {
        if (enterprises.isEmpty) {
          return const Card(
            child: ListTile(
              leading: Icon(Icons.business_outlined),
              title: Text('No enterprises in portfolio'),
            ),
          );
        }

        return Card(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: enterprises.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final enterprise = enterprises[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.accent.withValues(alpha: 0.1),
                  child: const Icon(Icons.business, color: AppColors.accent),
                ),
                title: Text(enterprise.businessName),
                subtitle: Text('Owner: ${enterprise.ownerName}'),
              );
            },
          ),
        );
      },
      loading: () => const Center(child: LinearProgressIndicator()),
      error: (_, __) => const Text('Error loading portfolio'),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.xs,
        bottom: AppSpacing.sm,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColors.textSecondaryLight,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
