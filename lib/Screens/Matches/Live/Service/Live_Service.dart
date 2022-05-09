import 'dart:convert';
import 'dart:developer';
import 'package:fantips/Model/Matches_Model/livemodel.dart';
import 'package:http/http.dart' as http;


class LiveService {
  static Future<Liveapi?> getLive({ required String value}) async {
    try {
      const url = "https://api.freefantasy.in/tips/getMatches";
      log("------------------------------${url}");

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields
          .addAll({'matchStatus': '4', 'offset': "0", 'limit': '20'});

      http.StreamedResponse response = await request.send();
      final data = await response.stream.bytesToString();
      print("CompletedMatches==666===>>>>>>>${data}");
      if (response.statusCode == 200) {
        return Liveapi.fromJson(jsonDecode(data));
      } else {
        return null;
      }
    } catch (e, st) {
      log("Error++==>$e ,$st");
    }finally {}
  }
}
