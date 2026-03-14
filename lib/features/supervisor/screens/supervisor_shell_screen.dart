import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mesmer_app/core/config/router_config.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';

class SupervisorShellScreen extends StatefulWidget {
  const SupervisorShellScreen({required this.child, super.key});

  final Widget child;

  @override
  State<SupervisorShellScreen> createState() => _SupervisorShellScreenState();
}

class _SupervisorShellScreenState extends State<SupervisorShellScreen> {
  int _selectedIndex = 0;

  static const List<_NavItem> _navItems = [
    _NavItem(
      label: 'Dashboard',
      icon: Icons.dashboard_outlined,
      activeIcon: Icons.dashboard_rounded,
      route: AppRoutes.supervisorHome,
    ),
    _NavItem(
      label: 'Enterprises',
      icon: Icons.business_outlined,
      activeIcon: Icons.business_rounded,
      route: AppRoutes.supervisorEnterprises,
    ),
    _NavItem(
      label: 'Reports',
      icon: Icons.bar_chart_outlined,
      activeIcon: Icons.bar_chart_rounded,
      route: AppRoutes.supervisorReports,
    ),
    _NavItem(
      label: 'Settings',
      icon: Icons.settings_outlined,
      activeIcon: Icons.settings_rounded,
      route: AppRoutes.supervisorSettings,
    ),
  ];

  void _onDestinationSelected(int idx) {
    setState(() => _selectedIndex = idx);
    context.go(_navItems[idx].route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: _navItems
            .map(
              (item) => NavigationDestination(
                icon: Icon(item.icon),
                selectedIcon: Icon(item.activeIcon, color: AppColors.primary),
                label: item.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _NavItem {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
  final String route;
}
