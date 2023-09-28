import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app_pages.dart';
import 'modules/splash/splash_page.dart';
import 'shared/themes/app_theme.dart';
import '../../../app_builder_widget/__bricks__/app/shared/widgets/app_builder_widget.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '{{title_app}}',
      getPages: AppPages.pages,
      themeMode: ThemeMode.light,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialRoute: SplashPage.route,
      locale: const Locale('pt_BR'),
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return AppBuilderWidget(child: child ?? const SizedBox());
      },
    );
  }
}
