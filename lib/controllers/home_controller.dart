import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController{
  int _counter = 0;

  get counter => _counter;

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

  void increment(){
    this._counter++;
    update(['text']); // here I can specify wich element on the view I want to re-render
  }

}