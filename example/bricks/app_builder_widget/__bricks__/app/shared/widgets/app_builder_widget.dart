import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../themes/app_colors.dart';

class AppBuilderWidget extends StatelessWidget {
  final Widget child;

  const AppBuilderWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<InternetConnectionStatus>(
      initialData: InternetConnectionStatus.connected,
      stream: InternetConnectionChecker().onStatusChange,
      builder: (context, snapshot) {
        if (snapshot.data == InternetConnectionStatus.disconnected ||
            snapshot.data == null) {
          return Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              child,
              MaterialBanner(
                elevation: 5,
                padding: const EdgeInsets.symmetric(vertical: 23),
                backgroundColor: AppColors.primary,
                content: const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.wifi_off_outlined,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Sem conexão',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: const [SizedBox()],
              ),
            ],
          );
        }
        return child;
      },
    );
  }
}
