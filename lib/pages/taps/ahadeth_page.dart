import 'package:flutter/material.dart';
import 'package:islamic_app/model/my_them_data.dart';
import 'package:islamic_app/pages/ahadth_details.dart';

class AhadethPage extends StatelessWidget {
 const AhadethPage({super.key});

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
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
              itemBuilder: (context, index) => Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AhadethDetails.routeName,
                        arguments: index);
                  },
                  child: Text(
                    '${index + 1} الحديث رقم',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: MyThemData.blackyColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'assets/fonts/KOUFIBD.TTF'),
                  ),
                ),
              ),
              itemCount: 50,
            ),
          )
        ],
      ),
    );
  }
}
