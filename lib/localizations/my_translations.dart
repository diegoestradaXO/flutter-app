import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en':{
      'languageSelect':'Choose your language',
      'homePageTitle':'My tasks',
      'taskTitleHint':'Write a title ...',
      'taskDescHint':'Enter a description for this task ...',
      'noDescriptonTask':'- No description for this task -'
    },
    'es':{
      'languageSelect':'Escoge tu lenguaje',
      'homePageTitle':'Mis Tareas',
      'taskTitleHint':'Escribe un título ...',
      'taskDescHint':'Coloca una descripción para esta tarea ...',
      'noDescriptonTask':'- No hay descripción para esta tarea -'
    }
  };
  
}