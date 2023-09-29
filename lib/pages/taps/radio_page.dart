import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          height: 200.h,
        ),
        const Spacer(
          flex: 1,
        ),
        Text(
          AppLocalizations.of(context)!.radioOfEthicsQuran,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.onError),
        ),
        const Spacer(
          flex: 1,
        ),
        Row(
          children: [
            const Spacer(),
            Icon(
              Icons.skip_previous_sharp,
              size: ScreenUtil().setWidth(35),
              color: Theme.of(context).colorScheme.error,
            ),
            const Spacer(
              flex: 1,
            ),
            Icon(
              Icons.play_arrow,
              size: ScreenUtil().setWidth(40),
              color: Theme.of(context).colorScheme.error,
            ),
            const Spacer(
              flex: 1,
            ),
            Icon(
              Icons.skip_next_rounded,
              size: ScreenUtil().setWidth(35),
              color: Theme.of(context).colorScheme.error,
            ),
            const Spacer()
          ],
        ),
        const Spacer(
          flex: 3,
        )
      ],
    );
  }
}
