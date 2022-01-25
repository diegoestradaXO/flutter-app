import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: _controller,
      builder: (_)=> Scaffold(
        body: Center(
          child: Text(
            _.counter.toString()
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            _.increment();
          },
          child: Icon(Icons.add),
        ),
      )

    );
  }
}
