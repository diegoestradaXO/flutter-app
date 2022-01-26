import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_app/controllers/home_controller.dart';
import 'package:my_app/l10n/l10n.dart';
import 'package:my_app/my_translations.dart';
import 'package:my_app/pages/welcome_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'pages/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    create: (context)=> HomeController();
    
    return GetMaterialApp(
      translations: MyTranslations(),
      locale: Get.deviceLocale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
      // supportedLocales: L10n.all, // Supported languages defined in /lib/l10n/l10n.dart
      // localizationsDelegates: [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate
      // ],
    );
  }
}

