import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constraint/sp_keys.dart';
import '../memory/shared/share_preference.dart';

extension LoggerExtension<T> on T {
  void logger() {
    if (kDebugMode) {
      print('Log my app => $this');
    }
  }
}

extension StringDefine on String?{
  bool isUrlLink(){
    RegExp exp = RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    return exp.hasMatch(this ?? "-");
  }
}

extension ContextScreen on BuildContext {
  ColorScheme getColorScheme() {
    return Theme.of(this).colorScheme;
  }

  TextTheme getTextTheme() {
    return Theme.of(this).textTheme;
  }

  double getWidth() {
    return MediaQuery.of(this).size.width;
  }

  double getHeight() {
    return MediaQuery.of(this).size.height;
  }

  double paddingBottom() => MediaQuery.of(this).padding.bottom;

  double paddingTop() => MediaQuery.of(this).padding.top;

  double screenDiagonal() => sqrt((getHeight() * getHeight()) + (getWidth() * getHeight()));

  double scaleDiagonal() => screenDiagonal() / (sqrt((414 * 414) + (895 * 895)));

  bool isLightMode() {
    return SharedPreference().readStorage(SpKeys.isLightTheme) ?? false;
  }
}