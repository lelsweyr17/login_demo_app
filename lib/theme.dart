import 'package:flutter/material.dart';

class Themes {
  static ThemeData mainTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      accentColor: Colors.tealAccent[100],
      primaryColor: Colors.teal,
      appBarTheme: AppBarTheme(backgroundColor: Colors.grey[850]),
    );
  }
}