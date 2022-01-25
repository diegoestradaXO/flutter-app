import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController{
  int _counter = 0;

  get counter => _counter;

  void increment(){
    this._counter++;
    update();
  }

}