import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class AppButtonDefault extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final bool usingJustPadding;
  final bool buttonDark;
  final double width;

  const AppButtonDefault({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.buttonDark = false,
    this.usingJustPadding = false,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: usingJustPadding ? null : width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: usingJustPadding ? 15 : 0,
            vertical: 10,
          ),
          backgroundColor: buttonDark ? AppColors.primary : Colors.white,
        ),
        onPressed: isLoading ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 3.5,
                    backgroundColor: AppColors.primary.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation(AppColors.primary),
                  ),
                ),
              ),
            Text(
              text,
              style: TextStyle(
                color: buttonDark ? AppColors.colorDark : AppColors.primary,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
