import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl_standalone.dart';
import 'package:my_app/l10n/l10n.dart';
import 'package:my_app/models/task.dart';
import 'package:my_app/pages/task_page.dart';
import 'package:my_app/provider/database_helper.dart';


class HomeController extends GetxController{
  RxList<Task> _taskData = <Task>[].obs;
  final allTasks = StreamController<Task>.broadcast();
  

  final GetStorage data = GetStorage();

  get taskData => _taskData;
  
  final _locales = [
    {'name':'🇺🇸 English','locale': Locale('en')},
    {'name':'🇪🇸 Spanish','locale': Locale('es')},
  ];

  get locales => _locales;

  @override
  void onInit() {
    _getData();
    super.onInit();
    print(data.read('preferedLocale') ?? 'n/a' ); // widget saved on memory, not rendered
  }
  
  void _getData() async {
    DatabaseHelper _dbhelper = DatabaseHelper();
    await _dbhelper.queryAllRows().then((value){
        value.forEach((element) {
          _taskData.add(Task(id: element['id'], title: element['title'], description: element['description']));
         }
        );
      }
    );
    print(_taskData);
    updateTask();
  }
  
  void updateTask(){
    update(['taskList']);
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