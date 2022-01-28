import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/models/task.dart';
import 'package:my_app/provider/database_helper.dart';


class HomeController extends GetxController{

  RxList<Task> _taskData = <Task>[].obs;
  final _locales = [
    {'name':'🇺🇸 English','locale': Locale('en')},
    {'name':'🇪🇸 Spanish','locale': Locale('es')},
  ];
  final GetStorage data = GetStorage();

  get taskData => _taskData;
  get locales => _locales;

  @override
  void onInit() {
    _getData();
    super.onInit();
    print(data.read('preferedLocale') ?? 'n/a' ); // widget saved on memory, not rendered
  }
  
  void _getData() async {
    DatabaseHelper _dbhelper = DatabaseHelper();
    await _dbhelper.getTasks().then((value){
        value.forEach((element) {
          _taskData.add(Task(id: element['id'], title: element['title'], description: element['description'], date: element['date']));
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

  void deleteTask(int id) async{
    DatabaseHelper _dbhelper = DatabaseHelper();
    await _dbhelper.delete(id);
    _taskData.removeWhere((element) => element.id == id);
    updateTask();
  }

  changeLanguage(Locale locale){
    data.write('preferedLocale', locale.toString());
    print(locale.toString());
    Get.back();
    Get.updateLocale(locale);
  }

}