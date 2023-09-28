import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class AppWidgetLoading extends StatelessWidget {
  const AppWidgetLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 6.0,
          backgroundColor: AppColors.backgroundLight,
        ),
      ),
    );
  }
}
