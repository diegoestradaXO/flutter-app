import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/controllers/home_controller.dart';
import 'package:my_app/widgets/task_card.dart';

class HomePage extends StatelessWidget {
  showLocaleDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Text('languageSelect'.tr),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(HomeController()
                              .locales[index]['name']
                              .toString()),
                        ),
                        onTap: () {
                          HomeController().changeLanguage(HomeController()
                              .locales[index]['locale'] as Locale);
                        },
                      ),
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                      ),
                  itemCount: 2),
            )));
  }

  @override
  Widget build(BuildContext context) {
    GetStorage data = GetStorage();
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return Scaffold(
            drawer: Drawer(
              child: Column(
                children: [
                  Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: context.theme.primaryColor,
                        borderRadius: BorderRadius.circular(100)),
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                    child: Image.asset(
                      "assets/images/lapiz.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    'Task App',
                    style: TextStyle(
                        fontSize: 35.0,
                        fontFamily: 'Agne',
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    thickness: 2.0,
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dark mode',
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'Agnes'),
                              ),
                              Container(
                              margin: EdgeInsets.only(left: 10),
                              child: ElevatedButton(
                                  onPressed: () {
                                    _.changeTheme();
                                  },
                                  child: Icon(Icons.dark_mode)),
                            )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: SafeArea(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        // Note Image, Page Title and Language Button
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
                              margin: EdgeInsets.only(left: 70),
                              child: ElevatedButton(
                                  onPressed: () {
                                    showLocaleDialog(context);
                                  },
                                  child: Icon(Icons.language)),
                            )
                          ],
                        )),
                    TaskList(),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blueGrey,
              onPressed: () {
                Get.offNamed('/task');
              },
              child: Icon(Icons.add,
                color: Colors.white,
              ),
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
    return Expanded(
        // Task List
        child: ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: GetBuilder<HomeController>(
        // init: TaskController(),
        id: 'taskList',
        builder: (home) {
          // home.onStatusChanged.listen(()=>{});
          return ListView.builder(
            itemCount: home.taskData.length,
            itemBuilder: (context, index) {
              return TaskCard(
                id: home.taskData[index].id,
                title: home.taskData[index].title,
                description: home.taskData[index].description,
                date: home.taskData[index].date,
              );
            },
          );
        },
      ),
    ));
  }
}
