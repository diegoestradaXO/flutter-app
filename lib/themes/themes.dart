import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    primaryColor: Colors.blueGrey
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black
  );
}