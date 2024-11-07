import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goes_hunt/core/routing/routes.dart';

import '../../layout/screens/splash/splash_screen.dart';

class RoutesActions{

  static Route<dynamic> allActions(RouteSettings settings){
    switch(settings.name){
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
}