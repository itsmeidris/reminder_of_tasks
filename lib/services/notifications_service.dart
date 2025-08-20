import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;
  set setInitialzed(bool value) {
    _isInitialized = value;
  }

  //INITIALIZE
  Future<void> initNotifications() async {
    if (_isInitialized) return; //prevent re-init

    //ANDROID INIT SETTINGS
    const initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    //IOS INIT SETTINGS
    const initSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true);

    //INIT SETTINGS
    const initSettings = InitializationSettings(
        android: initSettingsAndroid, iOS: initSettingsIOS);

    //INIT THE PLUGIN
    await notificationsPlugin.initialize(initSettings);
  }

  //NOTIFICATION DETAILS SETUP
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
            'transactions_channel_id', 'Transaction notifications',
            channelDescription: 'Transaction notifications Channel'),
        iOS: DarwinNotificationDetails());
  }

  //SHOW NOTIFICATIONS
  Future<void> showNotification(
      {int id = 0, String? title, String? body}) async {
    return notificationsPlugin.show(id, title, body, notificationDetails());
  }

    //SCHEDULE NOTIFICATION (MVP-style)
  Future<void> scheduleNotification({
    int id = 0,
    required String title,
    required String body,
    required DateTime scheduledDate,
  }) async {
    final now = DateTime.now();
    Duration delay = scheduledDate.difference(now);

    if (delay.isNegative) {
      // If time has passed, schedule for next day
      delay = delay + const Duration(days: 1);
    }

    debugPrint('Scheduling notification "$title" in $delay');

    Future.delayed(delay, () async {
      debugPrint('🔔 Triggering notification "$title" at ${DateTime.now()}');
      await showNotification(id: id, title: title, body: body);
    });
  }
}
