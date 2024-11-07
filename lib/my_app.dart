import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goes_hunt/core/extention/extention.dart';

import 'core/helper/helper.dart';
import 'core/memory/shared/share_preference.dart';
import 'initial/my_app_layout.dart';

void myAppStarts()async{

  runZonedGuarded(() async{

    WidgetsFlutterBinding.ensureInitialized();
    await SharedPreference.onInitialSharedPreferences();
    Helper().systemUIOverlayTheme();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    runApp( const MyAppLayout());
  }, (error, stack) {
    'error run myAppStarts: $error'.logger();
  });

}