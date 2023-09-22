import 'package:flutter/material.dart';

class MyThemData {
  static const Color primryColor = Color(0xffB7935F);
  static const Color blackyColor = Color(0xff242424);
  static const Color whiteColor = Color(0xffF8F8F8);
  static ThemeData lightThem = ThemeData(
      useMaterial3: true,
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
          fontWeight: FontWeight.w400,
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
  static ThemeData darkThem = ThemeData();
}
