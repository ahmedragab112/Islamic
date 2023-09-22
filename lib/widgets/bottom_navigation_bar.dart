import 'package:flutter/material.dart';
import 'package:islamic_app/model/my_them_data.dart';
import 'package:islamic_app/taps/ahadeth_page.dart';
import 'package:islamic_app/taps/moshaf_page.dart';
import 'package:islamic_app/taps/radio_page.dart';
import 'package:islamic_app/taps/sebha_page.dart';
import 'package:islamic_app/taps/setting_page.dart';

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
              'إسلامي',
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
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/radio_icon.png'),
                  ),
                  label: 'الراديو',
                  backgroundColor: MyThemData.primryColor),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/sebha_icon.png'),
                ),
                label: 'التسبيح',
                backgroundColor: MyThemData.primryColor,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/ahadeth_icon.png'),
                ),
                label: 'الأحاديث',
                backgroundColor: MyThemData.primryColor,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/images/moshaf_blue.png',
                  ),
                ),
                label: 'القرآن',
                backgroundColor: MyThemData.primryColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'الاعدادات',
                backgroundColor: MyThemData.primryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
