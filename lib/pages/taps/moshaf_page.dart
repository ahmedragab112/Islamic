import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/model/sura_model.dart';
import 'package:islamic_app/pages/quran_details.dart';
import 'package:islamic_app/widgets/build_table_row.dart';

class MoshafPage extends StatelessWidget {
  const MoshafPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Image.asset(
            'assets/images/quran_image.png',
            height: 220.h,
            width: 205.w,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.h,
          ),
        ),
        SliverToBoxAdapter(
          child: Table(
            border: TableBorder(
              top: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: 3.w,
              ),
              bottom: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: 3.w,
              ),
              verticalInside: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: 3.w,
              ),
            ),
            textBaseline: TextBaseline.alphabetic,
            textDirection: TextDirection.rtl,
            children: [
              TableRow(children: [
                BuildTableRow(
                    txt: AppLocalizations.of(context)!.suraNames, header: true),
                BuildTableRow(
                    txt: AppLocalizations.of(context)!.numberOfAyat,
                    header: true),
              ])
            ],
          ),
        ),
        SliverList.builder(
          itemCount: combinedList.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                QuranDetails.routeName,
                arguments: SurahData(
                  combinedList[index].numberOfAyat,
                  combinedList[index].name,
                  combinedList[index].numberOfSura,
                ),
              );
            },
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(child: BuildTableRow(txt: combinedList[index].name)),
                  VerticalDivider(
                    color: Theme.of(context).colorScheme.surface,
                    width: 3.w,
                    thickness: 3,
                  ),
                  Expanded(
                    child: BuildTableRow(
                      txt: "${combinedList[index].numberOfAyat}",
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
