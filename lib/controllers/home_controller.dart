import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/l10n/l10n.dart';
import 'package:my_app/models/task.dart';


class HomeController extends GetxController{
  int _counter = 0;
  List<Task> _tasks = [];
  get counter => _counter;

  final _locales = [
    {'name':'🇺🇸 English','locale': Locale('en')},
    {'name':'🇪🇸 Spanish','locale': Locale('es')},
  ];

  get locales => _locales;

  @override
  void onInit() {
    super.onInit();
    print("init"); // widget saved on memory, not rendered
  }

  @override
  void onReady() {
    super.onReady();
    print("ready"); // widget already rendered
  }

  updateLocale(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }

}