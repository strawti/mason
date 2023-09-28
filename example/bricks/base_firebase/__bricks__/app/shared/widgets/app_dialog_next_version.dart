import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_button_default.dart';

class DialogAlertFutureWidget extends StatelessWidget {
  const DialogAlertFutureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Material(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/programming.png',
                      scale: 3.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Eba, você descobriu algo novo',
                    style: Get.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Estamos trabalhando nessa função. Se você deseja isso na versão 2.0, clique no botão "quero".',
                    style: Get.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  AppButtonDefault(
                    text: 'Quero',
                    onPressed: () => Get.back(),
                    buttonDark: true,
                  ),
                  const SizedBox(height: 5),
                  AppButtonDefault(
                    text: 'Fechar',
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
