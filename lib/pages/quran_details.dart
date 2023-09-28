import 'package:flutter/material.dart';
import 'package:islamic_app/model/sura_model.dart';
import 'package:islamic_app/providers/languae_provider.dart';
import 'package:islamic_app/providers/sura_details_provider.dart';
import 'package:provider/provider.dart';

class QuranDetails extends StatelessWidget {
  const QuranDetails({super.key});

  static const String routeName = 'quranDetails';

  @override
  Widget build(BuildContext context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context);
    SurahData args = ModalRoute.of(context)!.settings.arguments as SurahData;
    return ChangeNotifierProvider(
      builder: (context, child) {
        SuraDetailsProvider suraDetailsProvider =
            Provider.of<SuraDetailsProvider>(context);
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
                  args.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              body: Container(
                margin: const EdgeInsets.only(
                    top: 20, right: 20, left: 20, bottom: 50),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.surface, width: 2),
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(
                          flex: 4,
                        ),
                        Text(
                          'سورة ${args.name}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'assets/fonts/KOUFIBD.TTF'),
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
                      child: suraDetailsProvider.verses.isEmpty
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) => Divider(
                                color: Theme.of(context).colorScheme.surface,
                                indent: 30,
                                endIndent: 30,
                              ),
                              itemBuilder: (context, index) => Center(
                                child: Text(
                                  '${suraDetailsProvider.verses[index]} ($index)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                              itemCount: suraDetailsProvider.verses.length,
                            ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
      create: (context) =>
          SuraDetailsProvider()..getFileData(args.numberOfSura),
    );
  }
}
