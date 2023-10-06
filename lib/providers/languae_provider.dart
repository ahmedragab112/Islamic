import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/hadith_model.dart';
import '../pages/taps/ahadeth_page.dart';
import '../pages/taps/moshaf_page.dart';
import '../pages/taps/radio_page.dart';
import '../pages/taps/sebha_page.dart';
import '../pages/taps/setting_page.dart';
import '../widgets/bottom_sheets/language_bottom_sheet.dart';
import '../widgets/bottom_sheets/themeing_bottom_sheet.dart';

class LanguageProvider extends ChangeNotifier {
  SharedPreferences? preferences;
  String languageCode = 'en';
  ThemeMode mode = ThemeMode.light;
  int counter = 1;
  double angel = 1;
  String txt = 'سبحان الله';
  int oneHundred = 0;
  List<HadaithModel> ahadthList = [];
  int indexOfScreen = 0;
  List<Widget> pageList = const [
    RadioPage(),
    SebhaPage(),
    AhadethPage(),
    MoshafPage(),
    SettingPage()
  ];

  Future<void> saveLanguage(String lang) async {
    String language = lang == 'en' ? 'en' : 'ar';
    await preferences!.setString('language', language);
  }

  Future<void> cashLanguage() async {
    preferences = await SharedPreferences.getInstance();
    String? oldLanguage = getLanguage();
    if (oldLanguage != null) {
      languageCode = oldLanguage == 'en' ? 'en' : 'ar';
    }
  }

  String? getLanguage() {
    return preferences!.getString('language');
  }

  Future<void> saveTheme(ThemeMode themeMode) async {
    String theme = themeMode == ThemeMode.dark ? 'dark' : 'light';
    await preferences!.setString('theme', theme);
  }

  Future<void> cashTheme() async {
    preferences = await SharedPreferences.getInstance();
    String? oldTheme = displayTheme();
    if (oldTheme != null) {
      mode = oldTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }
  }

  String? displayTheme() {
    return preferences!.getString('theme');
  }

  void onChangedTap(int index) {
    indexOfScreen = index;
    notifyListeners();
  }

  void loadFile() {
    if (ahadthList.isEmpty) {
      rootBundle.loadString('assets/files/ahadeth.txt').then((hadeth) {
        List<String> hadethOne = hadeth.split('#');
        for (int i = 0; i < hadethOne.length; i++) {
          String firstHadeth = hadethOne[i];
          List<String> lines = firstHadeth.trim().split('\n');
          String title = lines[0];
          lines.removeAt(0);
          ahadthList.add(HadaithModel(contain: lines, title: title));
          notifyListeners();
        }
      }).catchError((e) {});
    }
  }

  void changeLanguage(String newLanguage) {
    languageCode = newLanguage;
    saveLanguage(newLanguage);
    notifyListeners();
  }

  void changeThemMode(ThemeMode themeMode) {
    mode = themeMode;
    saveTheme(themeMode);
    notifyListeners();
  }

  String getBackGround({String lightImage = 'assets/images/background.png',
    String darkImage = 'assets/images/darkbg.png'}) {
    if (mode == ThemeMode.light) {
      return lightImage;
    } else {
      return darkImage;
    }
  }

  String getTheme(BuildContext context) {
    if (mode == ThemeMode.light) {
      return AppLocalizations.of(context)!.lightTheme;
    } else {
      return AppLocalizations.of(context)!.darkTheme;
    }
  }

  void showLanguageBottomSheet(BuildContext context) => showModalBottomSheet(
      context: context, builder: (context) => const LanguageBottomSheet());

  void showThemeingBttomSheet(BuildContext context) => showModalBottomSheet(
      context: context, builder: (context) => const ThemeingBottomSheet());

  void sebhaLogic() {
    counter++;
    angel++;
    if (counter > 0 && counter < 33) {
      txt = 'سبحان الله';
    } else if (counter > 33 && counter < 66) {
      txt = 'الحمدالله';
    } else if (counter > 66 && counter < 99) {
      txt = 'لا اله الا الله';
    } else if (counter > 99 && counter <= 100) {
      txt = 'الله اكبر';
      oneHundred++;
      counter = 0;
    }
    notifyListeners();
  }
}
