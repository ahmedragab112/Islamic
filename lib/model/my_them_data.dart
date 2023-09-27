import 'package:flutter/material.dart';

class MyThemData {
  static const Color primryColor = Color(0xffB7935F);
  static const Color blackyColor = Color(0xff242424);
  static const Color whiteColor = Color(0xffF8F8F8);
  static const Color yellow = Color(0xffFACC1D);
  static const Color darkPrimryColor = Color(0xff141A2E);

  static ThemeData lightThem = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primryColor,
        onPrimary: Colors.white,
        secondary: blackyColor,
        onSecondary: blackyColor,
        error: primryColor,
        onError: blackyColor,
        background: Colors.white,
        onBackground: Colors.white,
        surface: primryColor,
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: primryColor, size: 30),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontFamily: 'assets/fonts/ElMessiri-SemiBold.ttf',
          color: blackyColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'assets/fonts/ElMessiri-SemiBold.ttf',
          color: whiteColor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'assets/fonts/ElMessiri-SemiBold.ttf',
          color: blackyColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0.0,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: blackyColor,
        unselectedItemColor: Color(0xffF4F2EE),
      ));
  static ThemeData darkThem = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: darkPrimryColor,
      onPrimary: darkPrimryColor,
      secondary: yellow,
      onSecondary: Colors.white,
      error: yellow,
      onError: Colors.white,
      background: darkPrimryColor,
      onBackground: blackyColor,
      surface: yellow,
      onSurface: Colors.white,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white, size: 30),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0.0,
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontFamily: 'assets/fonts/ElMessiri-SemiBold.ttf',
        color: Color(0xffFACC1D),
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'assets/fonts/ElMessiri-SemiBold.ttf',
        color: whiteColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'assets/fonts/ElMessiri-SemiBold.ttf',
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0.0,
      type: BottomNavigationBarType.shifting,
      backgroundColor: darkPrimryColor,
      selectedItemColor: yellow,
      unselectedItemColor: Colors.white,
    ),
  );
}
