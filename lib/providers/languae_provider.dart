import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier {
  String languageCode = 'en';

  void changeLanguage(String newLanguage) {
    languageCode = newLanguage;
    notifyListeners();
  }
}
