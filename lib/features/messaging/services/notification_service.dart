import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    tz.initializeTimeZones();

    // Android initialization
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS initialization
    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Firebase Cloud Messaging
    await _initFCM();
  }

  Future<void> _initFCM() async {
    final messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      if (notification != null) {
        showNotification(
          id: message.hashCode,
          title: notification.title ?? 'MESMER',
          body: notification.body ?? '',
          payload: message.data['route'],
        );
      }
    });

    // Get FCM token for server-side sending
    final token = await messaging.getToken();
    // TODO: Save token to Supabase user profile for targeted push delivery
    // ignore: avoid_print
    print('FCM Token: $token');
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'mesmer_main',
      'MESMER Notifications',
      channelDescription: 'Coaching reminders and alerts',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(id, title, body, details, payload: payload);
  }

  /// Schedule a deadline reminder alert.
  Future<void> scheduleLoanReminderAlert({
    required String enterpriseName,
    required DateTime dueDate,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'mesmer_reminders',
      'MESMER Reminders',
      importance: Importance.high,
      priority: Priority.high,
    );

    const details = NotificationDetails(android: androidDetails);

    await _localNotifications.zonedSchedule(
      dueDate.hashCode,
      'Loan Repayment Reminder',
      '$enterpriseName: Loan repayment due today',
      tz.TZDateTime.from(dueDate, tz.local),
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  /// Schedule a coaching session reminder.
  Future<void> scheduleSessionReminder({
    required String enterpriseName,
    required DateTime sessionTime,
  }) async {
    final reminderTime = sessionTime.subtract(const Duration(hours: 1));
    if (reminderTime.isBefore(DateTime.now())) return;

    await scheduleLoanReminderAlert(
      enterpriseName: 'Session with $enterpriseName in 1 hour',
      dueDate: reminderTime,
    );
  }

  void _onNotificationTapped(NotificationResponse response) {
    // TODO: navigate based on response.payload using router
  }

  Future<void> cancelAll() async {
    await _localNotifications.cancelAll();
  }
}
