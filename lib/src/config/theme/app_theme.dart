import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Poppins',
    );
  }
}
