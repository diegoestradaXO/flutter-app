import 'package:get/get.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/splash_page.dart';
import 'package:my_app/pages/task_page.dart';

routes() => [
  GetPage(name: '/home', page: ()=> HomePage(), transition: Transition.zoom,),
  GetPage(name: '/task', page: ()=> TaskPage(), transition: Transition.fadeIn,),
  GetPage(name: '/welcome', page: ()=> SplashPage(), transition: Transition.zoom,),
];