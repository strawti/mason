import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class LocalNotificationService {
  Future<bool?> initialize({
    /// Payload in json
    ReceiveFuctionNotification onDidReceiveNotificationResponse,

    /// Payload in json
    ReceiveFuctionNotification onDidReceiveBackgroundNotificationResponse,
  });
  Future<void> show(
    int id,
    String title,
    String body, {
    String? payload,
  });
}

typedef ReceiveFuctionNotification = void Function(NotificationResponse)?;

class LocalNotificationServiceImpl implements LocalNotificationService {
  late final AndroidNotificationChannel channel;
  late final FlutterLocalNotificationsPlugin localNotification;

  @override
  Future<bool?> initialize({
    /// Payload in json
    ReceiveFuctionNotification onDidReceiveNotificationResponse,

    /// Payload in json
    ReceiveFuctionNotification onDidReceiveBackgroundNotificationResponse,
  }) async {
    localNotification = FlutterLocalNotificationsPlugin();

    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.high,
    );

    const androidSettings = InitializationSettings(
      android: AndroidInitializationSettings(
        '@mipmap/launcher_icon',
      ),
    );

    return await localNotification.initialize(
      androidSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );
  }

  @override
  Future<void> show(
    int id,
    String title,
    String body, {
    String? payload,
  }) async {
    localNotification.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          icon: '@mipmap/launcher_icon',
        ),
      ),
      payload: payload,
    );
  }
}
