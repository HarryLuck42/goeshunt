import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goes_hunt/core/locale/localizations.dart';
import 'package:goes_hunt/layout/screens/splash/splash_controller.dart';
import 'package:goes_hunt/widgets/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: SafeArea(child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
              child: CustomText(textToDisplay: lang(context).appTitle ?? ""))
        ],
      )),
    );
  }
}
