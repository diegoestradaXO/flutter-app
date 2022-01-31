import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_app/localizations/english.dart';
import 'package:my_app/localizations/spanish.dart';

class MyTranslations extends Translations {

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en':EnLanguage().language,
    'es':EsLanguage().language,
  };
  // mod this
}