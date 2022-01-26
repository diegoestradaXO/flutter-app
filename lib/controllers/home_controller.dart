import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl_standalone.dart';
import 'package:my_app/l10n/l10n.dart';
import 'package:my_app/models/task.dart';


class HomeController extends GetxController{

  final GetStorage data = GetStorage();
  
  final _locales = [
    {'name':'🇺🇸 English','locale': Locale('en')},
    {'name':'🇪🇸 Spanish','locale': Locale('es')},
  ];

  get locales => _locales;

  @override
  void onInit() {
    super.onInit();
    print("init");
    print(data.read('preferedLocale') ?? 'n/a' ); // widget saved on memory, not rendered
  }

  @override
  void onReady() {
    super.onReady();
    print("ready"); // widget already rendered
  }

  changeLanguage(Locale locale){
    data.write('preferedLocale', locale.toString());
    print(locale.toString());
    Get.back();
    Get.updateLocale(locale);
  }

}