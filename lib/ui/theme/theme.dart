import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      colorScheme: const ColorScheme.dark(
        primary: Colors.white,
        secondary: Colors.red,
        onPrimary: Colors.black,
        surface: Colors.black,
        onSurface: Colors.white,
        error: Colors.redAccent,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        headlineMedium: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: const IconThemeData(color: Colors.yellow),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
      ),
    );
  }
}
