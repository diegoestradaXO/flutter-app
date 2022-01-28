import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/home_controller.dart';
import 'package:my_app/controllers/task_controller.dart';
import 'package:my_app/models/task.dart';
import 'package:my_app/pages/task_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/widgets/task_card.dart';

class HomePage extends StatelessWidget {
  
  showLocaleDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('languageSelect'.tr),
        content: Container(
          width: double.maxFinite,
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder:(context, index) => InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(HomeController().locales[index]['name'].toString()),
              ),
              onTap: (){HomeController().changeLanguage(HomeController().locales[index]['locale'] as Locale);},
            ), 
            separatorBuilder: (context, index) => Divider(color: Colors.black,), 
            itemCount: 2
          ),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          var tr = AppLocalizations.of(context);
          return Scaffold(
            body: SafeArea(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container( // Note Image, Page Title and Language Button
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
                          'homePageTitle'.tr,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 70
                            ),
                            child: ElevatedButton(
                            onPressed: (){
                              showLocaleDialog(context);
                            },
                            child: Icon(Icons.language)
                          ),
                          )
                        ],
                      )
                    ),
                    TaskList(),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.offNamed('/task');
              },
              child: Icon(Icons.add),
            ),
          );
        });
  }
}

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded( // Task List
      child: ScrollConfiguration(
        behavior: NoGlowBehaviour(),
        child: GetBuilder<HomeController>(
          // init: TaskController(),
          id: 'taskList',
          builder: (home){
              // home.onStatusChanged.listen(()=>{});
              return ListView.builder(
              itemCount: home.taskData.length,
              itemBuilder: (context, index){
                return TaskCard(
                  id: home.taskData[index].id,
                  title: home.taskData[index].title,
                  description: home.taskData[index].description,                                  
                  );
              },
            );
          },
        ),
      )
    );
  }
}

// To Do: extract more widgets