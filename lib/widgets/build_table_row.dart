import 'package:flutter/material.dart';

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
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                txt,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontFamily: 'assets/fonts/KOUFIBD.TTF'),
              ),
            ),
          );
  }
}
