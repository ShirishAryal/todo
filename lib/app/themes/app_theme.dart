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
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500)),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: appcolor,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 15),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
          helperStyle: TextStyle(fontSize: 14),
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: .5)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: .5))),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: appcolor, elevation: 5),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      primaryColor: appcolor,
      scaffoldBackgroundColor: appcolor,
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
          color: appcolor,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500)),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: appcolor,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 15),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
          helperStyle: TextStyle(fontSize: 14),
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: .5)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: .5))),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: appcolor, elevation: 5),
    );
  }
}
