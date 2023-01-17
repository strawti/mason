import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import 'app_widget.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    //await Firebase.initializeApp();
    await GetStorage.init();

   // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    runApp(const AppWidget());
  }, (Object error, StackTrace stack) {
    //FirebaseCrashlytics.instance.recordError(error, stack);
  });
}
