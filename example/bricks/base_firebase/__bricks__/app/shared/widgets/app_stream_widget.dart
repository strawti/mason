import 'package:flutter/material.dart';

import 'app_widget_error.dart';
import 'app_widget_loading.dart';

class AppStreamWidget<T> extends StatelessWidget {
  final Widget Function(T? value, bool? error) builder;
  final Stream<T> stream;

  const AppStreamWidget({
    Key? key,
    required this.builder,
    required this.stream,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppWidgetLoading();
        } else if (snapshot.hasError) {
          return const AppWidgetError(
            message: 'Aconteceu um erro, tente de novo mais tarde',
          );
        } else {
          return builder(snapshot.data, snapshot.hasError);
        }
      },
    );
  }
}
