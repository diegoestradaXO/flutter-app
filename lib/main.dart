import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/localizations/my_translations.dart';
import 'package:my_app/routes/routes.dart';

void main() async {
  await GetStorage.init(); // Initializing storage driver using await
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GetStorage data = GetStorage(); // Getting the instance
    var localePref = data.read('preferedLocale'); // Reading the key 'preferedLocale' from that instance, if it exist, it will return the value, if not, return null.
    return GetMaterialApp(
      // Using the translations I did in the script /lib/localizations/my_translations.dart
      translations: MyTranslations(),
      // Down here I'm telling the app to either use the prefered language
      // for the user stored in the device, or take the locale from the system.
      locale: (localePref ?? '').isEmpty ? Get.deviceLocale : Locale(localePref),
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey, brightness: Brightness.light, backgroundColor: Colors.white),
      darkTheme: ThemeData(primarySwatch: Colors.blueGrey, brightness: Brightness.dark),
      initialRoute:'/welcome',
      getPages: routes(), // using the routes defined in the file /lib/routes/routes.dart
    );
  }
}

