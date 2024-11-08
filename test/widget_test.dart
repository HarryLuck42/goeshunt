
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:goes_hunt/core/locale/localizations.dart';
import 'package:goes_hunt/initial/app_controller.dart';
import 'package:goes_hunt/layout/components/state_widgets/loading_list.dart';
import 'package:goes_hunt/layout/screens/home/home_screen.dart';

void main() {
  
  testWidgets('Test Home Page', (WidgetTester tester) async {
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
    await tester.tap(find.byKey(Key("Video")));
    await tester.pump();
    await tester.pump(Duration(milliseconds: 500));
    expect(find.byType(LoadingList), findsOneWidget);
    await tester.tap(find.byKey(Key("Photo")));
    await tester.pump();
    await tester.pump(Duration(milliseconds: 500));
    expect(find.text("Goes Hunt"), findsOneWidget);
  });
}
