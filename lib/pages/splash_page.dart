import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_app/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (_) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 200,),
              Container(
                margin: EdgeInsets.only(bottom: 30.0),
                child: Image.asset(
                  "assets/images/lapiz.png",
                  height: 70,
                  width: 70,
                ),
              ),
              DefaultTextStyle(
                style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 40.0,
                    fontFamily: 'Agne',
                    fontWeight: FontWeight.bold),
                child: AnimatedTextKit(
                  pause: Duration(milliseconds: 1000),
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Task App',
                      speed: Duration(milliseconds: 250),
                      cursor: '_',  
                        ),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                  repeatForever: true,
                ),
              ),
              SizedBox(height: 200,),
              Text(
                'Be Productive',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 20,

                ),
              
              )
            ],
          ),
        ),
      ),
    );
  }
}
