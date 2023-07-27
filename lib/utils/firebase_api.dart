import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:oru_phones_assignment/screens/notification_screen.dart';

class FirebaseMessagingHandler {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  late GlobalKey<NavigatorState> _navigatorKey;

  void initialize(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
    _firebaseMessaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
      provisional: false,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle the notification when the app is in the foreground
      print("onMessage: ${message.notification?.body}");
      // You can display a local notification or show a custom in-app notification here
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle the notification when the app is in the background or terminated
      print("onMessageOpenedApp: ${message.notification?.body}");
      // Navigate to the NotificationScreen when the notification is clicked
      _navigateToNotificationScreen(message);
    });
  }

  void _navigateToNotificationScreen(RemoteMessage message) {
    _navigatorKey.currentState!.push(MaterialPageRoute(
        builder: (context) => NotificationScreen(
              message: message,
            )));
  }
}
