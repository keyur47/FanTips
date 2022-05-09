import 'dart:convert';
import 'dart:developer';
import 'package:fantips/Model/NewsModel.dart';
import 'package:http/http.dart' as http;

class NewsService {

  static Future<News?> getNews({ required String value}) async {
    print("{=====}");

    try {
      final url =
      Uri.parse("https://api.freefantasy.in/tips/getNewsList?offset=0&limit=20");
      final headers = {"Content-Type": "application/json"};
      final body = ({'offset': value, 'limit': value});
      print("---------------${url}");
      final response = await http.post(url,headers: headers, body: jsonEncode(body));
      log("hello4${response.body}");
      if (response.statusCode == 200) {
        log("Api Response4 ===>${response.body}");

        final News record = News.fromJson(jsonDecode(response.body));
        return record;
      }
    } catch (e , st) {
      log("Error==>$e ,$st");
    } finally {}
  }
}
