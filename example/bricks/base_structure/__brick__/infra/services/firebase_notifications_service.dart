import 'package:firebase_messaging/firebase_messaging.dart';

typedef MessageHandlerNotification = Future<void> Function(
  RemoteMessage message,
);

class FirebaseNotificationsService {
  Future<void> initialize({
    required MessageHandlerNotification onMessage,
    required MessageHandlerNotification onMessageOpenedApp,
    required MessageHandlerNotification pushBackgroundHandler,
  }) async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen(onMessage);
    FirebaseMessaging.onBackgroundMessage(pushBackgroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(onMessageOpenedApp);
  }

  Future<RemoteMessage?> initialMessage() async {
    return await FirebaseMessaging.instance.getInitialMessage();
  }
}
