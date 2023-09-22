import 'package:flutter/material.dart';
import 'package:islamic_app/model/my_them_data.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 3,
        ),
        Image.asset(
          'assets/images/radio_image.png',
          width: double.infinity,
        ),
        const Spacer(
          flex: 1,
        ),
        Text(
          'إذاعة القرآن الكريم',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: MyThemData.blackyColor),
        ),
        const Spacer(
          flex: 1,
        ),
        const Row(
          children: [
            Spacer(),
            Icon(
              Icons.skip_previous_sharp,
              size: 35,
              color: MyThemData.primryColor,
            ),
            Spacer(
              flex: 1,
            ),
            Icon(
              Icons.play_arrow,
              size: 40,
              color: MyThemData.primryColor,
            ),
            Spacer(
              flex: 1,
            ),
            Icon(
              Icons.skip_next_rounded,
              size: 40,
              color: MyThemData.primryColor,
            ),
            Spacer()
          ],
        ),
        const Spacer(
          flex: 3,
        )
      ],
    );
  }
}
