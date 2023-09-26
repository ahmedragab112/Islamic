import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/model/my_them_data.dart';
import 'package:islamic_app/pages/ahadth_details.dart';
import 'package:islamic_app/pages/quran_details.dart';
import 'package:islamic_app/widgets/bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        QuranDetails.routeName: (context) => const QuranDetails(),
        AhadethDetails.routeName: (context) => const AhadethDetails()
      },
      theme: MyThemData.lightThem,
      darkTheme: MyThemData.darkThem,
    );
  }
}
