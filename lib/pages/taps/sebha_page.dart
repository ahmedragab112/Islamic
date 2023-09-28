import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/providers/languae_provider.dart';
import 'package:provider/provider.dart';

class SebhaPage extends StatelessWidget {
  const SebhaPage({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context);
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 60),
                    margin: const EdgeInsets.only(top: 20),
                    child: Transform.rotate(
                      angle: provider.angel,
                      child: Image.asset(
                        provider.getBackGround(
                            lightImage: 'assets/images/body_of_seb7a.png',
                            darkImage: 'assets/images/dark_body_of_seb7a.png'),
                        fit: BoxFit.fill,
                        height: 200,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Text(
                      '${provider.oneHundred}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.error,
                            fontSize: 100,
                          ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 16),
                child: Image.asset(
                  provider.getBackGround(
                      lightImage: 'assets/images/head_of_seb7a.png',
                      darkImage: 'assets/images/dark_head_of_seb7a.png'),
                ),
              )
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            AppLocalizations.of(context)!.numberOfTasbeh,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              '${provider.counter}',
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.error,
            ),
            child: InkWell(
              onTap: () {
                provider.sebhaLogic();
              },
              child: Text(
                provider.txt,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(
            flex: 5,
          )
        ],
      ),
    );
  }
}
