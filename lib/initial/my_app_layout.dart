import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goes_hunt/core/lifecycle/lifecycle_manager.dart';
import 'package:goes_hunt/core/lifecycle/route_observer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:goes_hunt/layout/screens/splash/splash_screen.dart';

import '../core/locale/localizations.dart';
import '../core/routing/route_actions.dart';
import 'app_controller.dart';

class MyAppLayout extends StatefulWidget {
  const MyAppLayout({super.key});

  @override
  State<MyAppLayout> createState() => _MyAppLayoutState();
}

class _MyAppLayoutState extends State<MyAppLayout> {
  final ref = Get.put(AppController());

  @override
  void initState() {
    ref.setInitialState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => LifecycleManager(
            child: GetMaterialApp(
          title: "Goes Hunt",
          theme: ref.themeData.value,
          navigatorObservers: [
            CustomRouteObserver(),
            CustomRouteObserver.routeObserver
          ],
          supportedLocales: const [Locale("en"), Locale("id")],
          locale: Locale(ref.lang.value),
          localizationsDelegates: const [
            AppLocale.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          home: const SplashScreen(),
          onGenerateRoute: RoutesActions.allActions,
          debugShowCheckedModeBanner: false,
        )));
  }
}
