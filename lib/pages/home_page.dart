import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/controllers/home_controller.dart';
import 'package:get/route_manager.dart';
import 'package:my_app/pages/task_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/widgets/task_card.dart';

class HomePage extends StatelessWidget {
  
  showLocaleDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Choose your language'),
        content: Container(
          width: double.maxFinite,
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder:(context, index) => InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(HomeController().locales[index]['name'].toString()),
              ),
              onTap: (){HomeController().updateLocale(HomeController().locales[index]['locale'] as Locale);},
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
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: NoGlowBehaviour(),
                        child: GetBuilder<HomeController>(
                          id: 'taskList',
                          builder: (_) => ListView(
                            children: [
                              TaskCard(title: 'Continuar curso de Fernando Herrera', description: 'voy por el capitulo 09',),
                              TaskCard(title: 'Sacar la basura',),
                              TaskCard(title: 'Seguir curso de GetX', description: 'es en meduu.app y voy por el 5to video',),
                              TaskCard(title: 'Pasear al perro' ),
                              TaskCard(title: 'Enviar ensayo', description: '10 paginas minimo',)
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

              // child: GetBuilder<HomeController>(
              //   id: 'text',
              //   builder: (_) => Text(_.counter.toString()),
              // ),
