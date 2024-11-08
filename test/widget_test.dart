// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:goes_hunt/core/locale/localizations.dart';
import 'package:goes_hunt/initial/app_controller.dart';
import 'package:goes_hunt/layout/adapters/photo_adapter.dart';
import 'package:goes_hunt/layout/components/state_widgets/loading_list.dart';
import 'package:goes_hunt/layout/screens/home/home_screen.dart';

void main() {
  
  testWidgets('Cek Data Pictures', (WidgetTester tester) async {
    final ref = Get.put(AppController());
    ref.setInitialState();
    WidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(GetMaterialApp(
      supportedLocales: const [Locale("en"), Locale("id")],
      locale: Locale(ref.lang.value),
      localizationsDelegates: const [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      home: const HomeScreen(),
    ));
    expect(find.byIcon(Icons.image), findsOneWidget);
    expect(find.byIcon(Icons.ondemand_video_outlined), findsOneWidget);
    expect(find.byType(LoadingList), findsOneWidget);
    await tester.pump(Duration(seconds: 2));
    expect(find.byType(LoadingList), findsOneWidget);
  });
}
