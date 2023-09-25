import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {}

class AhadethDetails extends StatefulWidget {
  const AhadethDetails({super.key});

  static String routeName = 'ahadthpage';

  @override
  State<AhadethDetails> createState() => _AhadethDetailsState();
}

class _AhadethDetailsState extends State<AhadethDetails> {
  List<String> ahadthList = [];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    int args = ModalRoute.of(context)!.settings.arguments as int;
    index = args;
    if (ahadthList.isEmpty) {
      loadFile();
    }
    return Scaffold();
  }

  void loadFile() {
    rootBundle.loadString('assets/files/ahadeth.txt').then((hadeth) {
      List<String> hadethOne = hadeth.split('#');
      String firstHadeth = hadethOne[index];
      List<String> lines = firstHadeth.trim().split('\n');
      lines.removeAt(0);
      ahadthList = lines;
      setState(() {});
    });
  }
}
