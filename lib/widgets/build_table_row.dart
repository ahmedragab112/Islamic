import 'package:flutter/material.dart';
import 'package:islamic_app/model/my_them_data.dart';

class BuildTableRow extends StatelessWidget {
  const BuildTableRow({super.key, required this.txt, this.header=false});
 final bool header ;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return header
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                txt,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: MyThemData.blackyColor, fontWeight: FontWeight.w600),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                txt,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: MyThemData.blackyColor,
                    fontFamily: 'assets/fonts/KOUFIBD.TTF'),
              ),
            ),
          );
  }
}
