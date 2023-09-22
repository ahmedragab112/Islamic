// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:islamic_app/model/my_them_data.dart';

class SebhaPage extends StatefulWidget {
  const SebhaPage({super.key});

  @override
  State<SebhaPage> createState() => _SebhaPageState();
}

class _SebhaPageState extends State<SebhaPage> {
  int counter = 1;
  double angel = 1;
  String txt = 'سبحان الله';
  int oneHundred = 0;
  @override
  Widget build(BuildContext context) {
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
                    padding: EdgeInsets.only(top: 60),
                    child: Transform.rotate(
                      angle: angel,
                      child: Image.asset(
                        'assets/images/body_of_seb7a.png',
                        fit: BoxFit.fill,
                        height: 250,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Text(
                      '$oneHundred',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: MyThemData.primryColor,
                            fontSize: 120,
                          ),
                    ),
                  )
                ],
              ),
              Image.asset(
                'assets/images/head_of_seb7a.png',
                height: 88,
                width: 100,
                fit: BoxFit.fill,
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: MyThemData.blackyColor),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: MyThemData.primryColor,
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              '$counter',
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
              color: MyThemData.primryColor,
            ),
            child: InkWell(
              onTap: () {
                counter++;
                angel++;
                if (counter > 0 && counter < 33) {
                  txt = 'سبحان الله';
                } else if (counter > 33 && counter < 66) {
                  txt = 'الحمدالله';
                } else if (counter > 66 && counter < 99) {
                  txt = 'لا اله الا الله';
                } else if (counter > 99 && counter <= 100) {
                  txt = 'الله اكبر';
                  oneHundred++;
                  counter = 0;
                }

                setState(() {});
              },
              child: Text(
                txt,
                style: Theme.of(context).textTheme.bodyMedium,
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
