import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/providers/languae_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = 'homePage';

  @override
  Widget build(BuildContext context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.getBackGround(),
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
          body: provider.pageList[provider.indexOfScreen],
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 45,
            onTap: (value) => provider.onChangedTap(value),
            currentIndex: provider.indexOfScreen,
            items: [
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/radio_icon.png'),
                  ),
                  label: AppLocalizations.of(context)!.radio,
                  backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/sebha_icon.png'),
                ),
                label: AppLocalizations.of(context)!.tasbeh,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/ahadeth_icon.png'),
                ),
                label: AppLocalizations.of(context)!.ahadeth,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage(
                    'assets/images/moshaf_blue.png',
                  ),
                ),
                label: AppLocalizations.of(context)!.quran,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.setting,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
