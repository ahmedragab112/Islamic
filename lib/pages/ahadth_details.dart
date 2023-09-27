import 'package:flutter/material.dart';
import 'package:islamic_app/model/hadith_model.dart';
import 'package:islamic_app/providers/languae_provider.dart';
import 'package:provider/provider.dart';

import '../model/my_them_data.dart';

class AhadethDetails extends StatelessWidget {
  const AhadethDetails({super.key});

  static String routeName = 'ahadthpage';

  @override
  Widget build(BuildContext context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context);
    HadaithModel args =
        ModalRoute.of(context)!.settings.arguments as HadaithModel;

    return Stack(
      children: [
        Image.asset(
          provider.getBackGround(),
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Card(
            color: Theme.of(context).colorScheme.onPrimary,
            elevation: 10,
            margin:
                const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 50),
            shape: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: MyThemData.primryColor, width: 2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(
                        flex: 4,
                      ),
                      Text(
                        args.title,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'assets/fonts/KOUFIBD.TTF',
                            ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Icon(
                        Icons.play_circle_sharp,
                        size: 30,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const Spacer(
                        flex: 4,
                      )
                    ],
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.surface,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: args.contain.length,
                      itemBuilder: (context, index) => Center(
                        child: Text(
                          '${args.contain}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                          textAlign: TextAlign.center,
                        ),
                          ),
                      separatorBuilder: (context, index) => const Divider(
                        color: MyThemData.primryColor,
                        thickness: 2,
                        endIndent: 40,
                        indent: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
