import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SplashController extends GetxController
 {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(Duration(milliseconds: 3000), (){
      Get.offNamed('/home');
    });
  }
}