import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appLightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Color(0XFF8E8E93),
      selectedItemColor: Color(0XFF007AFF),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0XFFF9F9F9)
    ),
// elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        primary: Color(0xFF7B2C6B), // background color
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Color(0xFF7B2C6B),
      ),
    ),
    appBarTheme: AppBarTheme(
        elevation: 8, shadowColor: Color.fromRGBO(185, 185, 185, 0.5)));

ThemeData appDarkTheme = ThemeData(
  brightness: Brightness.dark,
);

void setCurrentStatusNavigationBarColor(bool isLightTheme) {
  if (isLightTheme) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFFFFFFFF),
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  } else {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF26242e),
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }
}
