import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quad_b/presentation/utils/consts/appDetails.dart';
import 'package:quad_b/presentation/utils/consts/image/image.dart';

import 'controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(-3, 3),
                  ),
                  BoxShadow(
                    color: Color.lerp(Colors.yellow, Colors.brown, 0.2)!,
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: const Offset(3, -3),
                  ),
                ],
              ),
              child: Image.asset(
                appLogo,
                width: 160,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: double.infinity,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(appVersion),
              ),
            )
          ],
        ),
      ),
    );
  }
}
