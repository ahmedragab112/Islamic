import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/model/my_them_data.dart';
import 'package:islamic_app/model/sura_model.dart';

class QuranDetails extends StatefulWidget {
  const QuranDetails({super.key});
  static const String routeName = 'quranDetails';

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SurahData args = ModalRoute.of(context)!.settings.arguments as SurahData;
    if (verses.isEmpty) {
      getFileData(args.numberOfSura);
    }
    return Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
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
            margin:
                const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 50),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: MyThemData.primryColor, width: 2),
                color: MyThemData.whiteColor,
                borderRadius: BorderRadius.circular(25)),
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
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MyThemData.blackyColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'assets/fonts/KOUFIBD.TTF'),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    const Icon(
                      Icons.play_circle_sharp,
                      size: 30,
                    ),
                    const Spacer(
                      flex: 4,
                    )
                  ],
                ),
                const Divider(
                  color: MyThemData.primryColor,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                Expanded(
                  child: verses.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: MyThemData.primryColor,
                          ),
                        )
                      : ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                            color: MyThemData.primryColor,
                            indent: 30,
                            endIndent: 30,
                          ),
                          itemBuilder: (context, index) => Center(
                            child: Text(
                              '${verses[index]} ($index) ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: MyThemData.blackyColor),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          itemCount: verses.length,
                        ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void getFileData(int index) async {
    String file = await rootBundle.loadString('assets/files/$index.txt');
    List<String> lines = file.split('\n');
    verses = lines;
    setState(() {});
  }
}
