import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goes_hunt/layout/screens/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: SafeArea(child: Stack()),
    );
  }
}
