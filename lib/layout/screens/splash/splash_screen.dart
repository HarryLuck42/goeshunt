import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goes_hunt/core/extention/extention.dart';
import 'package:goes_hunt/layout/screens/splash/splash_controller.dart';

import '../../../core/constraint/asset_path.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: SafeArea(child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Image.asset(
              '${AssetPath.image}cloud.webp',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: context.getHeight() * 0.3,
            child: Image.asset(
              '${AssetPath.image}app_icon.png',
              fit: BoxFit.contain,
              width: context.getWidth() * 0.5,
              height: context.getWidth() * 0.5,
            ),
          ),
          Positioned(
            bottom: 0,
            left: -100,
            right: -100,
            child: Image.asset("${AssetPath.image}field.webp",
                height: context.getHeight() * 0.5),
          ),
          Positioned(
            bottom: -50,
            left: 20,
            right: 20,
            child: Image.asset("${AssetPath.image}family.webp",
                height: context.getHeight() * 0.35),
          ),
        ],
      )),
    );
  }
}
