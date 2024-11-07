import 'dart:io';

import 'package:flutter/services.dart';

import '../constraint/sp_keys.dart';
import '../memory/shared/share_preference.dart';
import '../themes/app_colors.dart';

class Helper{
  Helper._private();

  static final Helper _instance = Helper._private();

  factory Helper() {
    return _instance;
  }

  Future<bool> checkConnections() async {
    bool connection = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connection = true;
      }
    } on SocketException catch (_) {
      connection = false;
    }
    return connection;
  }

  void systemUIOverlayTheme() {
    bool theme = SharedPreference().readStorage(SpKeys.isLightTheme) ?? true;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: theme ? Brightness.light : Brightness.dark,
      statusBarColor: theme ? Surface : LightSurface,
      systemNavigationBarIconBrightness: theme ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: theme ? Surface : LightSurface,
    ));
  }
}