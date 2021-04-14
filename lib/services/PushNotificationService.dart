import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  static Future init() async {
    _fcm.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    if (Platform.isIOS) {
      NotificationSettings settings = await _fcm.requestPermission();
      print('User granted permission: ${settings.authorizationStatus}');
    }
    var android =
        new AndroidInitializationSettings("drawable/notification_icon");
    var ios = new IOSInitializationSettings();
    var platform = new InitializationSettings(android: android, iOS: ios);
    flutterLocalNotificationsPlugin.initialize(platform);
    FirebaseMessaging.onMessage.listen((event) {
      print(event.notification);
      if (event.notification != null) {
        _showNotification(event.notification);
      }
    });
  }

  static void _showNotification(RemoteNotification message) async {
    var android = new AndroidNotificationDetails("OpenAppNotification",
        "OpenAppNotification", "Notification shown when app is open");
    var ios = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: ios);
    await flutterLocalNotificationsPlugin.show(
      Random().nextInt(9999),
      message.title,
      message.body,
      platform,
    );
  }
}
