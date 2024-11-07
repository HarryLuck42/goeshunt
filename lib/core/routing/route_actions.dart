import 'package:flutter/material.dart';
import 'package:goes_hunt/core/routing/routes.dart';

import '../../layout/screens/home/home_screen.dart';
import '../../layout/screens/settings/settings_screen.dart';
import '../../layout/screens/splash/splash_screen.dart';

class RoutesActions{

  static Route<dynamic> allActions(RouteSettings settings){
    switch(settings.name){
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
    }
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
}