import 'package:flutter/material.dart';

class ThemeingBottomSheet extends StatelessWidget {
  const ThemeingBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
    );
  }
}
