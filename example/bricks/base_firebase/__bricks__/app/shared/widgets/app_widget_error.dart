import 'package:flutter/material.dart';

import 'app_button_default.dart';

class AppWidgetError extends StatelessWidget {
  const AppWidgetError({
    super.key,
    required this.message,
    this.showButtonBack = false,
    this.showImage = true,
    this.description = '',
    this.scaleImage = 1.8,
  });

  final bool showButtonBack;
  final bool showImage;
  final String message;
  final String description;
  final double scaleImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 15),
        Visibility(
          visible: showImage,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              'assets/images/error.png',
              scale: scaleImage,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Visibility(
          visible: description.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Visibility(
          visible: showButtonBack,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            child: AppButtonDefault(
              buttonDark: true,
              onPressed: () {
                Navigator.pop(context);
              },
              text: 'Voltar',
            ),
          ),
        ),
      ],
    );
  }
}
