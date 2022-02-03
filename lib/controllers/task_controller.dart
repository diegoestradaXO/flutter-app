import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:my_app/controllers/home_controller.dart';
import 'package:my_app/models/task.dart';
import 'package:my_app/provider/database_helper.dart';

class TaskController extends GetxController {

  // HomeController _homeController = HomeController();

  
  int _taskId = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String _title = '';
  String _description = '';
  late final _homeController;

  get title => _title;
  get description => _description;


  get taskId => _taskId;

  final GetStorage data = GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final initHome = Get.put(HomeController);
    _homeController = Get.find<HomeController>();
    print('task on init');
  }

  setTitle(String value){
    _title = value;
  }

  setDescription(String value){
    _description = value;
  }

  createTask (String title, String? description) async {
    if(title != ''){
      DatabaseHelper _dbhelper = DatabaseHelper();
      DateFormat dateFormat = DateFormat("HH:mm - yyyy-MM-dd");
      String stringDate = dateFormat.format(DateTime.now());
      Task _newTask = Task(title: title, description: description, date: stringDate);
      _taskId = await _dbhelper.insertTask(_newTask);
      print('This is the task id $_taskId');
      print(stringDate);
      _homeController.taskData.add(_newTask);
      _homeController.updateTask();
    }
    titleController.clear();
    descriptionController.clear();   
    _title = '';
    _description = ''; 
  }
}