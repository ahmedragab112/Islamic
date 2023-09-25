import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/model/hadith_model.dart';

import '../model/my_them_data.dart';

class AhadethDetails extends StatefulWidget {
  const AhadethDetails({Key? key});
  static String routeName = 'ahadthpage';

  @override
  State<AhadethDetails> createState() => _AhadethDetailsState();
}

class _AhadethDetailsState extends State<AhadethDetails> {
  List<HadaithModel> ahadthList = [];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    int args = ModalRoute.of(context)!.settings.arguments as int;
    index = args;
    if (ahadthList.isEmpty) {
      loadFile();
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
              icon: Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              'تفاصيل الاحاديث',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 50),
            padding: EdgeInsets.all(20),
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
                    Spacer(
                      flex: 4,
                    ),
                    Text(
                      '${ahadthList[index].title}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: MyThemData.blackyColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'assets/fonts/KOUFIBD.TTF',
                          ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Icon(
                      Icons.play_circle_sharp,
                      size: 30,
                    ),
                    Spacer(
                      flex: 4,
                    )
                  ],
                ),
                Divider(
                  color: MyThemData.primryColor,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                Expanded(
                  child: ahadthList.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: MyThemData.primryColor,
                          ),
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) => Center(
                            child: Text(
                              '${ahadthList[index].contain}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: MyThemData.blackyColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          itemCount: ahadthList.length,
                        ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void loadFile() {
      rootBundle.loadString('assets/files/ahadeth.txt').then((hadeth) {
      List<String> hadethOne = hadeth.split('#');
      String firstHadeth = hadethOne[index];
      List<String> lines = firstHadeth.trim().split('\n');
      String title = lines[0];
      lines.removeAt(0);
      ahadthList.add(HadaithModel(contain: lines, title: title));
      print(ahadthList[index].contain);
      print(ahadthList[index].title);
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }
}
