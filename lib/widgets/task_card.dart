import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:my_app/controllers/home_controller.dart';

class TaskCard extends StatelessWidget {
  // final String placeholder;
  final int id;
  final String title;
  final String? description;
  TaskCard({
    // required this.placeholder,
    required this.id,
    required this.title,
    this.description
  });


  @override
  Widget build(BuildContext context) {
    // var t = AppLocalizations.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                title,
                style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                description ?? 'noDescriptonTask'.tr,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5
                ),
                ),
              ),
              ],
            ),
          ),
          GetBuilder<HomeController>(
            builder: (card){
              return IconButton(
              onPressed: (){
                card.deleteTask(id);
                print('Task deleted');
              }, 
              icon: Icon(Icons.delete),
              color: Colors.blueGrey,
            );
            },
          )
        ],
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xffF0F0EB)
       ),
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0, 
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context, Widget child, AxisDirection axisDirection){
      return child;
    }
  
}