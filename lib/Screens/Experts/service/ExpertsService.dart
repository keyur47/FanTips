import 'dart:convert';
import 'dart:developer';

import 'package:fantips/Model/Matches_Model/ExpertsModel.dart';
import 'package:fantips/Model/NewsModel.dart';
import 'package:http/http.dart' as http;

class ExpertService {
  static Future<Expert?> getExpert({ required int page}) async {
    print("{=====}");
    try {
      final body = {"offset": page,"limit": 25};
      final headers = {"Content-Type": "application/json"};

      final url =
      Uri.parse("https://api.freefantasy.in/tips/tipsters?offset=0&limit=20");
      print("----------445645-----${url}");
      final response = await http.post(url,body:jsonEncode(body),headers: headers);
      log("hello444${response.body}");
      if (response.statusCode == 200) {
        log("Api Response4 ===>${response.body}");

        final Expert record = Expert.fromJson(jsonDecode(response.body));
        return record;
      }
    } catch (e , st) {
      log("Error==>$e ,$st");
    } finally {}
  }
}
