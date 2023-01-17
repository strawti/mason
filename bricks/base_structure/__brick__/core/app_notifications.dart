import 'dart:convert';
import 'dart:developer';

import '../infra/services/firebase_notifications_service.dart';
import '../infra/services/local_notifications_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class AppNotifications {
  final LocalNotificationService localNotificationService;
  final FirebaseNotificationsService firebaseNotificationsService;

  AppNotifications({
    required this.localNotificationService,
    required this.firebaseNotificationsService,
  });

  Future<RemoteMessage?> getInitialMessage() async {
    return await firebaseNotificationsService.initialMessage();
  }

  Future<void> onDidReceiveNotificationResponse(
    NotificationResponse notification,
  ) async {
    final String? payload = notification.payload;

    if (payload != null) {
      final data = json.decode(payload);
      log("Notification Payload: $data", name: "AppNotifications");
    }
  }

  Future<void> onDidReceiveBackgroundNotificationResponse(
    NotificationResponse notification,
  ) async {
    throw UnimplementedError(
        "onDidReceiveBackgroundNotificationResponse not implemented");
  }

  Future<void> onMessage(RemoteMessage remoteMessage) async {
    bool isAndroid = GetPlatform.isAndroid;
    bool isWeb = GetPlatform.isWeb;

    if (isAndroid && isWeb == false) {
      await localNotificationService.show(
        remoteMessage.notification.hashCode,
        remoteMessage.notification!.title!,
        remoteMessage.notification!.body!,
        payload: json.encode(remoteMessage.data),
      );
    }
  }

  Future<void> onMessageOpenedApp(RemoteMessage message) async {
    throw UnimplementedError("onMessageOpenedApp not implemented");
  }

  Future<void> pushBackgroundHandler(RemoteMessage message) async {
    throw UnimplementedError("pushBackgroundHandler not implemented");
  }

  Future<void> initialize() async {
    log("Starting Local Notifications Service", name: "AppNotifications");
    await localNotificationService.initialize(
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );
    log("Initialized Notification Service", name: "AppNotifications");

    log("Starting External Notifications Service", name: "AppNotifications");
    await firebaseNotificationsService.initialize(
      onMessage: onMessage,
      onMessageOpenedApp: onMessageOpenedApp,
      pushBackgroundHandler: pushBackgroundHandler,
    );
    log("Initialized External Notification Service", name: "AppNotifications");
  }
}
