import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            height: 220,
            width: 205,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: Table(
            border: TableBorder(
              top: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: 3,
              ),
              bottom: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: 3,
              ),
              verticalInside: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: 3,
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
        SliverToBoxAdapter(
          child: Table(
            border: TableBorder(
              verticalInside: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: 3,
              ),
            ),
            textBaseline: TextBaseline.alphabetic,
            textDirection: TextDirection.rtl,
            children: [
              TableRow(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
                      child: BuildTableRow(txt: combinedList[index].name),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: combinedList.length,
                    itemBuilder: (context, index) => BuildTableRow(
                      txt: "${combinedList[index].numberOfAyat}",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
