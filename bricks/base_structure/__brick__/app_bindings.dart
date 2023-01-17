import 'package:get/get.dart';

import 'core/api_client/api_client.dart';
import 'core/api_client/get_connect_client.dart';
import 'core/app_notifications.dart';
import 'infra/api_utils.dart';
import 'infra/services/firebase_notifications_service.dart';
import 'infra/services/local_notifications_service.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() {
      final apiUtils = ApiUtils();
      final connect = GetConnect();

      connect.httpClient.timeout = const Duration(seconds: 30);
      connect.httpClient.addRequestModifier(apiUtils.requestModifier);
      connect.httpClient.addResponseModifier(apiUtils.responseModifier);

      return connect;
    }, fenix: true);

    Get.put<ApiClient>(GetConnectClient(Get.find()));
    // Get.put<ApiClient>(HttpClient(Get.find()));

    Get.put<LocalNotificationService>(LocalNotificationServiceImpl());
    Get.put(FirebaseNotificationsService());

    Get.putAsync(() async {
      final dependencie = AppNotifications(
        localNotificationService: Get.find(),
        firebaseNotificationsService: Get.find(),
      );
      return await dependencie.initialize();
    });
  }
}
