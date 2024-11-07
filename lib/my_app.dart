import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goes_hunt/core/extention/extention.dart';

import 'initial/my_app_layout.dart';

void myAppStarts()async{

  runZonedGuarded(() async{

    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    runApp( const MyAppLayout());
  }, (error, stack) {
    'error run myAppStarts: $error'.logger();
  });

}