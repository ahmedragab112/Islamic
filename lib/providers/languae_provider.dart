import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String languageCode = 'en';
  ThemeMode mode = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    languageCode = newLanguage;
    notifyListeners();
  }

  void changeThemMode(ThemeMode themeMode) {
    mode = themeMode;
    notifyListeners();
  }

  String getBackGround() {
    if (mode == ThemeMode.light) {
      return 'assets/images/background.png';
    } else {
      return 'assets/images/darkbg.png';
    }
  }
}
