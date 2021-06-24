import 'package:flutter/material.dart';

enum StyleTheme { light, dark }

final styleThemes = {
  StyleTheme.light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Colors.grey[700],
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.grey[700]),
    ),
  ),
  StyleTheme.dark: ThemeData(
    brightness: Brightness.dark,
  ),
};
