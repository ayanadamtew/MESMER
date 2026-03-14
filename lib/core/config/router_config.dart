import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mesmer_app/features/auth/screens/splash_screen.dart';
import 'package:mesmer_app/features/auth/screens/login_screen.dart';
import 'package:mesmer_app/features/auth/screens/register_screen.dart';
import 'package:mesmer_app/features/auth/providers/auth_provider.dart';
import 'package:mesmer_app/features/enterprise/screens/enterprise_list_screen.dart';
import 'package:mesmer_app/features/enterprise/screens/enterprise_onboarding_screen.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';
import 'package:mesmer_app/features/diagnosis/screens/diagnosis_screen.dart';
import 'package:mesmer_app/features/coaching/screens/coaching_calendar_screen.dart';
import 'package:mesmer_app/features/coaching/screens/active_session_screen.dart';
import 'package:mesmer_app/features/coaching/screens/training_schedule_screen.dart';
import 'package:mesmer_app/features/progress/screens/progress_dashboard_screen.dart';
import 'package:mesmer_app/features/reports/screens/reports_screen.dart';
import 'package:mesmer_app/features/messaging/screens/messaging_list_screen.dart';
import 'package:mesmer_app/features/messaging/screens/chat_screen.dart';
import 'package:mesmer_app/features/auth/screens/main_shell_screen.dart';
// Supervisor
import 'package:mesmer_app/features/supervisor/screens/supervisor_shell_screen.dart';
import 'package:mesmer_app/features/supervisor/screens/supervisor_dashboard_screen.dart';
import 'package:mesmer_app/features/supervisor/screens/supervisor_enterprises_screen.dart';
import 'package:mesmer_app/features/supervisor/screens/supervisor_reports_screen.dart';
import 'package:mesmer_app/features/supervisor/screens/supervisor_settings_screen.dart';
// Enterprise Portal
import 'package:mesmer_app/features/enterprise_portal/screens/enterprise_shell_screen.dart';
import 'package:mesmer_app/features/enterprise_portal/screens/enterprise_dashboard_screen.dart';
import 'package:mesmer_app/features/enterprise_portal/screens/enterprise_recommendations_screen.dart';
import 'package:mesmer_app/features/enterprise_portal/screens/enterprise_notifications_screen.dart';
import 'package:mesmer_app/features/enterprise_portal/screens/enterprise_messages_screen.dart';
import 'package:mesmer_app/features/enterprise_portal/screens/enterprise_linking_screen.dart';
import 'package:mesmer_app/features/auth/screens/profile_screen.dart';

// Route names as constants
class AppRoutes {
  AppRoutes._();
  static const splash = '/';
  static const login = '/login';
  static const register = '/register';

  // ─── Coach ───
  static const shell = '/app';
  static const enterprises = '/app/enterprises';
  static const enterpriseOnboarding = '/app/enterprises/new';
  static const enterpriseEdit = '/app/enterprises/edit';
  static const diagnosis = '/app/enterprises/:enterpriseId/diagnosis';
  static const calendar = '/app/calendar';
  static const activeSession = '/app/session/:sessionId';
  static const progress = '/app/enterprises/:enterpriseId/progress';
  static const reports = '/app/reports';
  static const messaging = '/app/messaging';
  static const chat = '/app/messaging/:enterpriseId';
  static const coachProfile = '/app/profile';
  static const trainingSchedule = '/app/training';
  static const coachHome = enterprises;

  // ─── Supervisor ───
  static const supervisorHome = '/supervisor';
  static const supervisorEnterprises = '/supervisor/enterprises';
  static const supervisorReports = '/supervisor/reports';
  static const supervisorSettings = '/supervisor/settings';

  // ─── Enterprise User ───
  static const enterpriseHome = '/enterprise-portal';
  static const enterpriseRecommendations = '/enterprise-portal/recommendations';
  static const enterpriseMessages = '/enterprise-portal/messages';
  static const enterpriseNotifications = '/enterprise-portal/notifications';
  static const enterpriseProfile = '/enterprise-portal/profile';
  static const enterpriseLink = '/enterprise-portal/link';
}

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull != null;
      final isOnSplash = state.matchedLocation == AppRoutes.splash;
      final isOnLogin = state.matchedLocation == AppRoutes.login;
      final isOnRegister = state.matchedLocation == AppRoutes.register;

      if (isOnSplash) return null;
      if (!isLoggedIn && !isOnLogin && !isOnRegister) return AppRoutes.login;
      
      if (isLoggedIn) {
        final role = authState.value?.userMetadata?['role'] ?? 'coach';
        final isSupervisor = role == 'supervisor';
        final isEnterprise = role == 'enterprise';
        
        final isOnCoachPath = state.matchedLocation.startsWith('/app');
        final isOnSupervisorPath = state.matchedLocation.startsWith('/supervisor');
        final isOnEnterprisePath = state.matchedLocation.startsWith('/enterprise-portal');

        if (isOnLogin || isOnRegister || isOnSplash) {
          if (isSupervisor) return AppRoutes.supervisorHome;
          if (isEnterprise) {
            final linkedId = authState.value?.userMetadata?['linked_enterprise_id'] as String?;
            if (linkedId == null) return AppRoutes.enterpriseLink;
            return AppRoutes.enterpriseHome;
          }
          return AppRoutes.coachHome;
        }

        // Cross-role protection
        if (isSupervisor && (isOnCoachPath || isOnEnterprisePath)) {
          return AppRoutes.supervisorHome;
        }
        
        if (isEnterprise) {
          if (isOnCoachPath || isOnSupervisorPath) return AppRoutes.enterpriseHome;
          final linkedId = authState.value?.userMetadata?['linked_enterprise_id'] as String?;
          final isOnLinkScreen = state.matchedLocation == AppRoutes.enterpriseLink;
          
          if (linkedId == null && !isOnLinkScreen) {
            // We don't force redirect here anymore to allow linkedEnterpriseProvider 
            // a chance to auto-link by email on the Dashboard.
            // If the provider fails to find a match, the Dashboard itself
            // can navigate to the link screen if needed.
            return null; 
          } else if (linkedId != null && isOnLinkScreen) {
            return AppRoutes.enterpriseHome; // Already linked
          }
        }
        
        if (!isSupervisor && !isEnterprise && (isOnSupervisorPath || isOnEnterprisePath)) {
          return AppRoutes.coachHome;
        }
      }
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
      GoRoute(
        path: AppRoutes.register,
        builder: (_, __) => const RegisterScreen(),
      ),

      // ─── Coach Shell ───
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
            path: AppRoutes.enterpriseEdit,
            builder: (_, state) {
              final enterprise = state.extra as Enterprise?;
              return EnterpriseOnboardingScreen(existingEnterprise: enterprise);
            },
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
            builder: (_, state) {
              // Extract extra parameters passed from list
              final map = state.extra as Map<String, dynamic>? ?? {};
              return ChatScreen(
                enterpriseId: state.pathParameters['enterpriseId'] ?? '',
                receiverId: map['receiverId'] as String? ?? '',
                chatTitle: map['chatTitle'] as String? ?? 'Chat',
              );
            },
          ),
          GoRoute(
            path: AppRoutes.coachProfile,
            builder: (_, __) => const ProfileScreen(),
          ),
          GoRoute(
            path: AppRoutes.trainingSchedule,
            builder: (_, __) => const TrainingScheduleScreen(),
          ),
        ],
      ),

      // ─── Supervisor Shell ───
      ShellRoute(
        builder: (context, state, child) => SupervisorShellScreen(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.supervisorHome,
            builder: (_, __) => const SupervisorDashboardScreen(),
          ),
          GoRoute(
            path: AppRoutes.supervisorEnterprises,
            builder: (_, __) => const SupervisorEnterprisesScreen(),
          ),
          GoRoute(
            path: AppRoutes.supervisorReports,
            builder: (_, __) => const SupervisorReportsScreen(),
          ),
          GoRoute(
            path: AppRoutes.supervisorSettings,
            builder: (_, __) => const ProfileScreen(),
          ),
        ],
      ),

      // ─── Enterprise User Shell ───
      ShellRoute(
        builder: (context, state, child) => EnterpriseShellScreen(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.enterpriseHome,
            builder: (_, __) => const EnterpriseDashboardScreen(),
          ),
          GoRoute(
            path: AppRoutes.enterpriseRecommendations,
            builder: (_, __) => const EnterpriseRecommendationsScreen(),
          ),
          GoRoute(
            path: AppRoutes.enterpriseMessages,
            builder: (_, state) {
              // Normally this would use linkedEnterpriseProvider but we're in the router.
              // For simplicity, we can pass dummy values here, or better yet, build a specialized 
              // `EnterpriseMessagesScreen` that fetches its own linked enterprise before wrapping `ChatScreen`.
              return const EnterpriseMessagesScreen();
            },
          ),GoRoute(
            path: AppRoutes.enterpriseNotifications,
            builder: (_, __) => const EnterpriseNotificationsScreen(),
          ),
          GoRoute(
            path: AppRoutes.enterpriseProfile,
            builder: (_, __) => const ProfileScreen(),
          ),
        ],
      ),

      // ─── Standalone Routes ───
      GoRoute(
        path: AppRoutes.enterpriseLink,
        builder: (_, __) => const EnterpriseLinkingScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.error}'),
      ),
    ),
  );
});
