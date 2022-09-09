import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app_bindings.dart';
import 'presenter/splash/splash_page.dart';
import 'routes/app_pages.dart';
import 'themes/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: appThemeLight,
      getPages: appPages,
      themeMode: ThemeMode.light,
      initialBinding: AppBindings(),
      initialRoute: SplashPage.route,
      fallbackLocale: const Locale('pt', 'BR'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      // builder: _builder,
    );
  }

  Widget _builder(context, widget) {
    Widget error = const Text('...ERRO DE RENDERIZAÇÃO...');

    if (widget is Scaffold || widget is Navigator) {
      error = Scaffold(body: Center(child: error));
    }

    ErrorWidget.builder = (FlutterErrorDetails errorDetails) => error;

    return widget;
  }
}
