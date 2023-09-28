import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/model/my_them_data.dart';
import 'package:islamic_app/providers/languae_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
            textAlign: TextAlign.start,
          ),
          InkWell(
            onTap: () {
              provider.showLanguageBottomSheet(context);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: MyThemData.primryColor),
              ),
              child: Text(
                AppLocalizations.of(context)!.english,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
            textAlign: TextAlign.start,
          ),
          InkWell(
            onTap: () {
              provider.showThemeingBttomSheet(context);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: MyThemData.primryColor),
              ),
              child: Text(
                provider.getTheme(context),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
