import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// const appcolor = Color(0xFFA020F0);
const appcolor = Color(0xFFFFFFFF);

class AppTheme {
  static ThemeData get light {
    return ThemeData(
        primaryColor: appcolor,
        scaffoldBackgroundColor: appcolor,
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
            color: appcolor,
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: appcolor,
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        // primaryIconTheme: const IconThemeData(color: Colors.black),
        // listTileTheme: const ListTileThemeData(iconColor: Colors.black),
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 15),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: appcolor, elevation: 5));
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
