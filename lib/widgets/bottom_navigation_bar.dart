import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/model/my_them_data.dart';
import 'package:islamic_app/pages/taps/ahadeth_page.dart';
import 'package:islamic_app/pages/taps/moshaf_page.dart';
import 'package:islamic_app/pages/taps/sebha_page.dart';
import 'package:islamic_app/pages/taps/setting_page.dart';

import '../pages/taps/radio_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = 'homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Widget> pageList = const [
    RadioPage(),
    SebhaPage(),
    AhadethPage(),
    MoshafPage(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.appTitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: pageList[index],
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 45,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            currentIndex: index,
            items: [
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/radio_icon.png'),
                  ),
                  label: AppLocalizations.of(context)!.radio,
                  backgroundColor: MyThemData.primryColor),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/sebha_icon.png'),
                ),
                label: AppLocalizations.of(context)!.tasbeh,
                backgroundColor: MyThemData.primryColor,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/ahadeth_icon.png'),
                ),
                label: AppLocalizations.of(context)!.ahadeth,
                backgroundColor: MyThemData.primryColor,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage(
                    'assets/images/moshaf_blue.png',
                  ),
                ),
                label: AppLocalizations.of(context)!.quran,
                backgroundColor: MyThemData.primryColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.setting,
                backgroundColor: MyThemData.primryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
