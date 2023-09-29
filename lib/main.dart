import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/model/my_them_data.dart';
import 'package:islamic_app/pages/ahadth_details.dart';
import 'package:islamic_app/pages/quran_details.dart';
import 'package:islamic_app/providers/languae_provider.dart';
import 'package:islamic_app/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LanguageProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context);
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        locale: Locale(provider.languageCode),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          QuranDetails.routeName: (context) => const QuranDetails(),
          AhadethDetails.routeName: (context) => const AhadethDetails()
        },
        themeMode: provider.mode,
        theme: MyThemData.lightThem,
        darkTheme: MyThemData.darkThem,
      ),
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }
}
