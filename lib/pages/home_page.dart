import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/home_controller.dart';
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
                    Expanded( // Task List
                      child: ScrollConfiguration(
                        behavior: NoGlowBehaviour(),
                        child: GetBuilder<HomeController>(
                          id: 'taskList',
                          builder: (_) => ListView(
                            children: [
                              TaskCard(title: 'Continue with Fernando\'s Flutter course', description: 'currently on chapter 09',),
                              TaskCard(title: 'Take out the trash',),
                              TaskCard(title: 'Continue with GetX course', description: 'on meedu.app, video 05',),
                              TaskCard(title: 'Go for a walk with my dog' ),
                              TaskCard(title: 'Submit my essay', description: '10 pages minimum',)
                            ],
                          ),
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(() => TaskPage(), transition: Transition.fadeIn);
              },
              child: Icon(Icons.add),
            ),
          );
        });
  }
}