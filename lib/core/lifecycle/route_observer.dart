import 'package:flutter/cupertino.dart';
import 'package:goes_hunt/core/extention/extention.dart';

import '../routing/app_routing.dart';

class CustomRouteObserver extends RouteObserver<PageRoute<dynamic>>{
  final _routing = AppRouting();

  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  /// Called when the current route has been pushed.
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    'didPush ${route.settings.name} '.logger();
    super.didPush(route, previousRoute);
    _routing.removeSnackBar();
  }

  /// The [Navigator] replaced `oldRoute` with `newRoute`.
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    'didReplace ${newRoute?.settings.name} '.logger();
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    'didPop ${route.settings.name} '.logger();
    super.didPop(route, previousRoute);
  }
}