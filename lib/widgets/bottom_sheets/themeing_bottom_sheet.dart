import 'package:flutter/material.dart';
import 'package:islamic_app/providers/languae_provider.dart';
import 'package:provider/provider.dart';

import '../../model/my_them_data.dart';

class ThemeingBottomSheet extends StatelessWidget {
  const ThemeingBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        border: Border.all(
          color: Theme.of(context).colorScheme.error,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      height: MediaQuery.of(context).size.height * .2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              provider.changeThemMode(ThemeMode.light);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Light',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: provider.mode == ThemeMode.light
                          ? MyThemData.primryColor
                          : Theme.of(context).colorScheme.secondary),
                ),
                provider.mode == ThemeMode.light
                    ? Icon(
                  Icons.check,
                        color: provider.mode == ThemeMode.light
                            ? MyThemData.primryColor
                            : Theme.of(context).colorScheme.secondary,
                        size: 35,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeThemMode(ThemeMode.dark);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: provider.mode == ThemeMode.dark
                          ? Theme.of(context).colorScheme.error
                          : MyThemData.primryColor),
                ),
                provider.mode == ThemeMode.dark
                    ? Icon(
                        Icons.check,
                        size: 35,
                        color: provider.mode == ThemeMode.dark
                            ? MyThemData.primryColor
                            : Theme.of(context).colorScheme.secondary,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
