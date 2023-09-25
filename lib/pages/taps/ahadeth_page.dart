import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/model/hadith_model.dart';
import 'package:islamic_app/model/my_them_data.dart';
import 'package:islamic_app/pages/ahadth_details.dart';

class AhadethPage extends StatefulWidget {
  const AhadethPage({super.key});

  @override
  State<AhadethPage> createState() => _AhadethPageState();
}

class _AhadethPageState extends State<AhadethPage> {
  List<HadaithModel> ahadthList = [];

  @override
  void initState() {
    super.initState();
    loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/ahadeth_image.png',
            width: 300,
            height: 200,
            fit: BoxFit.fill,
          ),
          Divider(
            thickness: 2,
            color: MyThemData.primryColor,
          ),
          Text(
            'الأحاديث',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: MyThemData.blackyColor),
          ),
          Divider(
            thickness: 2,
            color: MyThemData.primryColor,
          ),
          ahadthList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: MyThemData.primryColor,
                  ),
                )
              : Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      endIndent: 40,
                      indent: 40,
                      thickness: 2,
                      color: MyThemData.primryColor,
                    ),
                    itemBuilder: (context, index) => Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AhadethDetails.routeName,
                              arguments: ahadthList[index]);
                        },
                        child: Text(
                          '${ahadthList[index].title}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: MyThemData.blackyColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'assets/fonts/KOUFIBD.TTF'),
                        ),
                      ),
                    ),
                    itemCount: ahadthList.length,
                  ),
                )
        ],
      ),
    );
  }

  void loadFile() {
    rootBundle.loadString('assets/files/ahadeth.txt').then((hadeth) {
      List<String> hadethOne = hadeth.split('#');
      for (int i = 0; i < hadethOne.length; i++) {
        String firstHadeth = hadethOne[i];
        List<String> lines = firstHadeth.trim().split('\n');
        String title = lines[0];
        lines.removeAt(0);
        ahadthList.add(HadaithModel(contain: lines, title: title));
        setState(() {});
      }
    }).catchError((e) {
      print(e.toString());
    });
  }
}
