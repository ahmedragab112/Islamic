import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/model/my_them_data.dart';
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
            width: 100,
            fit: BoxFit.fill,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: Table(
            border: const TableBorder(
              top: BorderSide(
                color: MyThemData.primryColor,
                width: 3,
              ),
              bottom: BorderSide(
                color: MyThemData.primryColor,
                width: 3,
              ),
              verticalInside: BorderSide(
                color: MyThemData.primryColor,
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
              border: const TableBorder(
                verticalInside: BorderSide(
                  color: MyThemData.primryColor,
                  width: 3,
                ),
              ),
              textBaseline: TextBaseline.alphabetic,
              textDirection: TextDirection.rtl,
              children: combinedList
                  .map(
                    (e) => TableRow(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              QuranDetails.routeName,
                              arguments: SurahData(
                                e.numberOfAyat,
                                e.name,
                                e.numberOfSura,
                              ),
                            );
                          },
                          child: BuildTableRow(txt: e.name),
                        ),
                        BuildTableRow(txt: e.numberOfAyat.toString())
                      ],
                    ),
                  )
                  .toList()),
        ),
      ],
    );
  }
}
