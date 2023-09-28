import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier {
  List<String> verses = [];

  void getFileData(int index) async {
    if (verses.isEmpty) {
      String file = await rootBundle.loadString('assets/files/$index.txt');
      List<String> lines = file.split('\n');
      verses = lines;
      notifyListeners();
    }
  }
}
