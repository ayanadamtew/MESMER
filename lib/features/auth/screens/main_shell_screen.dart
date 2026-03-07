import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mesmer_app/core/config/router_config.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';

class MainShellScreen extends StatefulWidget {
  const MainShellScreen({required this.child, super.key});

  final Widget child;

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  int _selectedIndex = 0;

  static const List<_NavItem> _navItems = [
    _NavItem(
      label: 'Enterprises',
      icon: Icons.business_outlined,
      activeIcon: Icons.business_rounded,
      route: AppRoutes.enterprises,
    ),
    _NavItem(
      label: 'Calendar',
      icon: Icons.calendar_month_outlined,
      activeIcon: Icons.calendar_month_rounded,
      route: AppRoutes.calendar,
    ),
    _NavItem(
      label: 'Reports',
      icon: Icons.bar_chart_outlined,
      activeIcon: Icons.bar_chart_rounded,
      route: AppRoutes.reports,
    ),
    _NavItem(
      label: 'Messages',
      icon: Icons.chat_bubble_outline_rounded,
      activeIcon: Icons.chat_bubble_rounded,
      route: AppRoutes.messaging,
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
