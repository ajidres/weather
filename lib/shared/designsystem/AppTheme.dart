import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._privateConstructor();

  static final AppTheme instance = AppTheme._privateConstructor();

  Color bnkPrimary = const Color.fromRGBO(246, 57, 97, 1);
  Color darkGray = const Color(0xff55565a);

  ThemeData theme() {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: bnkPrimary),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 4,
        ),
        appBarTheme: AppBarTheme(color: Colors.white,
        titleTextStyle: TextStyle(
            fontSize: 18,
            color: darkGray,
            fontWeight: FontWeight.bold)),
        textTheme: TextTheme(
            titleLarge: TextStyle(
                fontSize: 28,
                color: darkGray,
                fontWeight: FontWeight.bold),
            titleMedium: TextStyle(
                fontSize: 18,
                color: darkGray,
                fontWeight: FontWeight.bold),
            titleSmall: TextStyle(
                fontSize: 14,
                color: darkGray,
                fontWeight: FontWeight.bold),
            displayLarge: TextStyle(fontSize: 16, color: darkGray),
            bodyMedium: TextStyle(fontSize: 14, color: darkGray),
            bodySmall: TextStyle(fontSize: 12, color: darkGray)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(
                minimumSize: Size(250, 40),
                foregroundColor: Colors.white,
                backgroundColor: bnkPrimary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                textStyle: TextStyle(color: Colors.white, fontSize: 16))));
  }

  OutlineInputBorder boxForm = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide(
      color: Color(0xff55565a),
      width: 1.0,
    ),
  );
}
