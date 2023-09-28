import 'dart:io';

import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import 'app_button_default.dart';

class AppChoicePhoto extends StatelessWidget {
  final File? fileImage;
  final VoidCallback? onPressedGallery;
  final VoidCallback? onPressedCamera;
  final Future<void> getLostData;

  const AppChoicePhoto({
    Key? key,
    this.fileImage,
    required this.getLostData,
    this.onPressedGallery,
    this.onPressedCamera,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getLostData,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox();
        }
        return Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.greyWeak,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Escolha de onde pegar a imagem',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  fileImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            fileImage!,
                            width: MediaQuery.of(context).size.width * 0.4,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(
                          Icons.image_rounded,
                          size: 125,
                          color: AppColors.backgroundDark,
                        ),
                  Column(
                    children: [
                      AppButtonDefault(
                        buttonDark: true,
                        width: 90,
                        onPressed: onPressedCamera,
                        text: 'Câmera',
                      ),
                      const SizedBox(height: 10),
                      AppButtonDefault(
                        buttonDark: true,
                        width: 90,
                        onPressed: onPressedGallery,
                        text: 'Galeria',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
