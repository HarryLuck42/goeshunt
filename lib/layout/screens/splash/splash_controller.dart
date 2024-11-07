import 'package:goes_hunt/core/routing/routes.dart';

import '../../../core/base/base_controller.dart';

class SplashController extends BaseController{

  @override
  Future onInit() async {
    goToHomeScreen();
    super.onInit();
  }

  Future goToHomeScreen() async {
    Future.delayed(const Duration(seconds: 3), (){
      routing.moveReplacement(Routes.home);
    });
  }
}