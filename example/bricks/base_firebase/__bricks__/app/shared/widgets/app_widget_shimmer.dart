import 'package:flutter/material.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

import '../themes/app_colors.dart';

class AppWidgetShimmer extends StatelessWidget {
  const AppWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerPro.sized(
      light: ShimmerProLight.darker,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      height: 50,
      width: double.maxFinite,
      borderRadius: 50,
    );
  }
}
