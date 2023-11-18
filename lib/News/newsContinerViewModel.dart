import 'package:flutter/cupertino.dart';
import 'package:news/Api/api_manger.dart';
import 'package:news/model/NewsResponse.dart';
class newsContinerModelView extends ChangeNotifier{
  List<News>?listNews;
  String ?erorrMessage;
  void getNewsById(String sourceId,{int ?page})async{
    try {
      listNews=null;
      erorrMessage=null;
      notifyListeners();
      var respons = await ApiManger.getNewsBysourceid(sourceId: sourceId,page: page);
      if(respons.status=='erorr'){
        erorrMessage=respons.message;
      }else{

        listNews=respons.articles;
      }
    }catch(e){
    erorrMessage='Erorr';
    }
    notifyListeners();
  }
}