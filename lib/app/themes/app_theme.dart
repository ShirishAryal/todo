import 'package:flutter/material.dart';

const appcolor = Color(0xFFA020F0);

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primaryColor: appcolor,
      appBarTheme: const AppBarTheme(
        color: appcolor,
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: appcolor,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      iconTheme: const IconThemeData(
        color: appcolor,
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 15),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color(0xFF000000),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: const Color(0xFF000000),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      toggleableActiveColor: const Color(0xFF000000),
    );
  }
}
