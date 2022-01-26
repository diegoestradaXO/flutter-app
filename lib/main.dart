import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/localizations/my_translations.dart';
import 'pages/home_page.dart';


void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GetStorage data = GetStorage();
    return GetMaterialApp(
      translations: MyTranslations(),
      locale: (data.read('preferedLocale') ?? '').isEmpty ? Get.deviceLocale : Locale(data.read('preferedLocale')),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}

