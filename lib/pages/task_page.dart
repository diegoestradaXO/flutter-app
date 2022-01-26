import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'home_page.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding( // Back Arrow and Title TextField
                padding: const EdgeInsets.only(top: 24.0, bottom: 10.0),
                child: Row(
                  children: [
                    InkWell( // Back Arrow Icon
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image.asset(
                          "assets/images/arrow.png",
                         height: 20,
                         width: 20,
                        ),
                      ),
                    ),
                    Expanded( // Title Text Field
                      child: TextField(
                        onSubmitted: (value){
                          print(value);
                        },
                        decoration: InputDecoration(
                        hintText: 'taskTitleHint'.tr,
                        border: InputBorder.none,
                        ),
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2e2f43)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding( // Description Text Field
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  onSubmitted: (value){
                    print(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'taskDescHint'.tr,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 24.0)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}