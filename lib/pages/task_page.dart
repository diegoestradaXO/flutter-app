import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/task_controller.dart';
import 'package:my_app/pages/home_page.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      init: TaskController(),
      builder: (_){
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
                            Get.to(HomePage(), transition: Transition.fadeIn);
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
                            controller: _.titleController,
                            onChanged: _.setTitle,
                            decoration: InputDecoration(
                            hintText: 'taskTitleHint'.tr,
                            border: InputBorder.none,
                            ),
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,)
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding( // Description Text Field
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      controller: _.descriptionController,
                      onChanged: _.setDescription,
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
          floatingActionButton: CheckButton(),
        );
      },
    );
  }
}

class CheckButton extends StatelessWidget {
  const CheckButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final task = Get.find<TaskController>();
    return FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: (){
          var snackMessage = '';
          print('Title is: ${task.title}, and description is: ${task.description}.');
          if(task.title != ''){
            if(task.description != ''){
            task.createTask(task.title, task.description);
            }else{
            task.createTask(task.title, null);
            }
            snackMessage = 'taskCreatedSucceeded'.tr;
          } else {
            snackMessage = 'taskCreatedFailed'.tr;
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(snackMessage),
              duration: const Duration(milliseconds: 2000),
              action: SnackBarAction(
              label: 'OK',
              onPressed: () {},
              )
            )
          );
          Get.to(HomePage(), transition: Transition.fadeIn);
      },
        child: Icon(Icons.check, color: Colors.white,),
      );
  }
}