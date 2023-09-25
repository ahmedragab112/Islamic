import 'package:flutter/material.dart';
import 'package:islamic_app/model/hadith_model.dart';

import '../model/my_them_data.dart';

class AhadethDetails extends StatefulWidget {
  const AhadethDetails({Key? key});

  static String routeName = 'ahadthpage';

  @override
  State<AhadethDetails> createState() => _AhadethDetailsState();
}

class _AhadethDetailsState extends State<AhadethDetails> {
  @override
  Widget build(BuildContext context) {
    HadaithModel args =
        ModalRoute.of(context)!.settings.arguments as HadaithModel;

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
              args.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Card(
            elevation: 10,
            margin: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 50),
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: MyThemData.primryColor, width: 2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(
                        flex: 4,
                      ),
                      Text(
                        '${args.title}',
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
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemCount: args.contain.length,
                      itemBuilder: (context, index) => Center(
                        child: Text(
                          '${args.contain}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: MyThemData.blackyColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      separatorBuilder: (context, index) => Divider(
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
