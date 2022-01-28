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
      'noDescriptonTask':'- No description for this task -',
      'taskCreatedSucceeded':'Task created succesfully!',
      'taskCreatedFailed':'Couldn\'t create the task, try again...',
      'taskDeletedMessage':'Task deleted successfully!',
    },
    'es':{
      'languageSelect':'Escoge tu lenguaje',
      'homePageTitle':'Mis Tareas',
      'taskTitleHint':'Escribe un título ...',
      'taskDescHint':'Coloca una descripción para esta tarea ...',
      'noDescriptonTask':'- No hay descripción para esta tarea -',
      'taskCreatedSucceeded':'¡Tarea creada con éxito!',
      'taskCreatedFailed':'No se pudo crear la tarea, intenta otra vez...',
      'taskDeletedMessage':'¡Tarea eliminada con éxito!',
    }
  };
  // mod this
}