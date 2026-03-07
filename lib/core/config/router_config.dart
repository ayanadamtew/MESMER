import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mesmer_app/features/auth/screens/splash_screen.dart';
import 'package:mesmer_app/features/auth/screens/login_screen.dart';
import 'package:mesmer_app/features/auth/providers/auth_provider.dart';
import 'package:mesmer_app/features/enterprise/screens/enterprise_list_screen.dart';
import 'package:mesmer_app/features/enterprise/screens/enterprise_onboarding_screen.dart';
import 'package:mesmer_app/features/diagnosis/screens/diagnosis_screen.dart';
import 'package:mesmer_app/features/coaching/screens/coaching_calendar_screen.dart';
import 'package:mesmer_app/features/coaching/screens/active_session_screen.dart';
import 'package:mesmer_app/features/progress/screens/progress_dashboard_screen.dart';
import 'package:mesmer_app/features/reports/screens/reports_screen.dart';
import 'package:mesmer_app/features/messaging/screens/messaging_list_screen.dart';
import 'package:mesmer_app/features/messaging/screens/chat_screen.dart';
import 'package:mesmer_app/features/auth/screens/main_shell_screen.dart';

// Route names as constants
class AppRoutes {
  AppRoutes._();
  static const splash = '/';
  static const login = '/login';
  static const shell = '/app';
  static const enterprises = '/app/enterprises';
  static const enterpriseOnboarding = '/app/enterprises/new';
  static const diagnosis = '/app/enterprises/:enterpriseId/diagnosis';
  static const calendar = '/app/calendar';
  static const activeSession = '/app/session/:sessionId';
  static const progress = '/app/enterprises/:enterpriseId/progress';
  static const reports = '/app/reports';
  static const messaging = '/app/messaging';
  static const chat = '/app/messaging/:chatId';
}

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull != null;
      final isOnSplash = state.matchedLocation == AppRoutes.splash;
      final isOnLogin = state.matchedLocation == AppRoutes.login;

      if (isOnSplash) return null;
      if (!isLoggedIn && !isOnLogin) return AppRoutes.login;
      if (isLoggedIn && isOnLogin) return AppRoutes.enterprises;
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (_, __) => const LoginScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainShellScreen(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.enterprises,
            builder: (_, __) => const EnterpriseListScreen(),
          ),
          GoRoute(
            path: AppRoutes.enterpriseOnboarding,
            builder: (_, __) => const EnterpriseOnboardingScreen(),
          ),
          GoRoute(
            path: AppRoutes.diagnosis,
            builder: (_, state) => DiagnosisScreen(
              enterpriseId: state.pathParameters['enterpriseId'] ?? '',
            ),
          ),
          GoRoute(
            path: AppRoutes.calendar,
            builder: (_, __) => const CoachingCalendarScreen(),
          ),
          GoRoute(
            path: AppRoutes.activeSession,
            builder: (_, state) => ActiveSessionScreen(
              sessionId: state.pathParameters['sessionId'] ?? '',
            ),
          ),
          GoRoute(
            path: AppRoutes.progress,
            builder: (_, state) => ProgressDashboardScreen(
              enterpriseId: state.pathParameters['enterpriseId'] ?? '',
            ),
          ),
          GoRoute(
            path: AppRoutes.reports,
            builder: (_, __) => const ReportsScreen(),
          ),
          GoRoute(
            path: AppRoutes.messaging,
            builder: (_, __) => const MessagingListScreen(),
          ),
          GoRoute(
            path: AppRoutes.chat,
            builder: (_, state) => ChatScreen(
              chatId: state.pathParameters['chatId'] ?? '',
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.error}'),
      ),
    ),
  );
});
