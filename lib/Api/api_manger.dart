import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/Api/apiconstants.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourcesRespones.dart';

class ApiManger {
  static Future<SourcesRespones> getsources(String categoryId) async {
    Uri url = Uri.https(ApiConstans.baseUrl, ApiConstans.sourceApi,
        {'apiKey': '60d7575e7e594d5aad44ebed270eec4c', 'category': categoryId});
    try {
      var respones = await http.get(url);
      var bodyString = respones.body;
      var json = jsonDecode(bodyString);
      return SourcesRespones.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse> getNewsBysourceid({String? sourceId, String? query,int ?page}) async {
    Uri url = Uri.https(ApiConstans.baseUrl, ApiConstans.newsApi, {
      'apiKey': '60d7575e7e594d5aad44ebed270eec4c',
      'sources': sourceId,
      'q': query,
      'page':page.toString(),
      //'page':'1',
      //'pageSize':'5',
    });

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
