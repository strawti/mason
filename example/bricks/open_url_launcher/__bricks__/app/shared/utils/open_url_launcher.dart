import 'package:url_launcher/url_launcher.dart';

import '../utils/app_snackbar.dart';

Future<void> openUrlLauncher(String url, {LaunchMode? mode}) async {
  if (!await launchUrl(
    Uri.parse(url),
    mode: mode ?? LaunchMode.externalApplication,
  )) {
    AppSnackbar.show("Não foi possível abrir a url");
  }
}
