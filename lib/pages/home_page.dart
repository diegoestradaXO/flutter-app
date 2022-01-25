import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/controllers/home_controller.dart';
import 'package:get/route_manager.dart';
import 'package:my_app/pages/task_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/widgets/task_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                // color: Color(0xffF0F0EB),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0, top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Image.asset(
                            "assets/images/lapiz.png",
                            height: 30,
                            width: 30,
                          ),
                          ),
                          Text(
                            'My tasks',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ),
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: NoGlowBehaviour(),
                        child: ListView(
                        children: [
                          TaskCard(title: 'Task #1', description: 'this is the description',),
                          TaskCard(title: 'Task #2', description: 'this is the description',),
                          TaskCard(title: 'Task #3', description: 'this is the description',),
                          TaskCard(title: 'Task #4', description: 'this is the description',),
                          TaskCard(title: 'Task #5', description: 'this is the description',)
                        ],
                      ),
                      )
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // _.increment();
                Get.to(() => TaskPage(), transition: Transition.fadeIn);
              },
              child: Icon(Icons.add),
            ),
          );
        });
  }
}

              // child: GetBuilder<HomeController>(
              //   id: 'text',
              //   builder: (_) => Text(_.counter.toString()),
              // ),
