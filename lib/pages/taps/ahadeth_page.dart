import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/model/my_them_data.dart';
import 'package:islamic_app/pages/ahadth_details.dart';
import 'package:islamic_app/providers/languae_provider.dart';
import 'package:provider/provider.dart';

class AhadethPage extends StatelessWidget {
  const AhadethPage({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context);
    provider.loadFile();
    return Center(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Image.asset(
              'assets/images/ahadeth_image.png',
              width: 300.w,
              height: 200.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              thickness: 2,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              AppLocalizations.of(context)!.ahadeth,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSecondary),
              textAlign: TextAlign.center,
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              thickness: 2,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          provider.ahadthList.isEmpty
              ? const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(
                color: MyThemData.primryColor,
              ),
            ),
          )
              : SliverList.separated(
            separatorBuilder: (context, index) => Divider(
                    endIndent: 40,
                    indent: 40,
                    thickness: 2,
                    color: Theme.of(context).colorScheme.error,
                  ),
            itemBuilder: (context, index) => Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AhadethDetails.routeName,
                            arguments: provider.ahadthList[index]);
                      },
                child: Text(
                  provider.ahadthList[index].title,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onSecondary,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'assets/fonts/KOUFIBD.TTF'),
                ),
              ),
            ),
            itemCount: provider.ahadthList.length,
          )
        ],
      ),
    );
  }
}
