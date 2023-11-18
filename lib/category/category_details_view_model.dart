import 'package:flutter/cupertino.dart';
import 'package:news/Api/api_manger.dart';
import 'package:news/model/SourcesRespones.dart';

class categoryDetailseViewModel extends ChangeNotifier {
  List<Source>? sourceListe;
  String? erorrMessage;

  void getSourceyId(String categoryId) async {
    sourceListe =null;
    erorrMessage=null;
    notifyListeners();
    try {
      var response = await ApiManger.getsources(categoryId);

      if (response.status == 'erorr') {
        erorrMessage = response.message;
      } else {
        sourceListe = response.sources;
      }
    } catch (e) {
      erorrMessage='Erorr';
    }
    notifyListeners();
  }
}
