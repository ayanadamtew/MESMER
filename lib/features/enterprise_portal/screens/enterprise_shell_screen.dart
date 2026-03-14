import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mesmer_app/core/config/router_config.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';

class EnterpriseShellScreen extends StatefulWidget {
  const EnterpriseShellScreen({required this.child, super.key});

  final Widget child;

  @override
  State<EnterpriseShellScreen> createState() => _EnterpriseShellScreenState();
}

class _EnterpriseShellScreenState extends State<EnterpriseShellScreen> {
  int _selectedIndex = 0;

  static const List<_NavItem> _navItems = [
    _NavItem(
      label: 'Home',
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
      route: AppRoutes.enterpriseHome,
    ),
    _NavItem(
      label: 'Tips',
      icon: Icons.lightbulb_outline,
      activeIcon: Icons.lightbulb_rounded,
      route: AppRoutes.enterpriseRecommendations,
    ),
    _NavItem(
      label: 'Messages',
      icon: Icons.chat_bubble_outline_rounded,
      activeIcon: Icons.chat_bubble_rounded,
      route: AppRoutes.enterpriseMessages,
    ),
    _NavItem(
      label: 'Alerts',
      icon: Icons.notifications_outlined,
      activeIcon: Icons.notifications_rounded,
      route: AppRoutes.enterpriseNotifications,
    ),
    _NavItem(
      label: 'Profile',
      icon: Icons.person_outline,
      activeIcon: Icons.person_rounded,
      route: AppRoutes.enterpriseProfile,
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
