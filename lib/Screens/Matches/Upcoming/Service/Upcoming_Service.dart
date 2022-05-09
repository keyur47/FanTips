import 'dart:convert';
import 'dart:developer';
import 'package:fantips/Model/Matches_Model/UpcomingModel.dart';
import 'package:http/http.dart' as http;


class UpcomingService {
  static Future<Upcomingapi?> getUpcoming({ required String value}) async {
    try {
      const url = "https://api.freefantasy.in/tips/getMatches";

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields
          .addAll({'matchStatus': '4', 'offset': "0", 'limit': '20'});

      http.StreamedResponse response = await request.send();
      final data = await response.stream.bytesToString();
      print("CompletedMatches=====>>>>>>>${data}");
      if (response.statusCode == 200) {
        return Upcomingapi.fromJson(jsonDecode(data));
      } else {
        return null;
      }
    } catch (e, st) {
      log("Error++==>$e ,$st");
    }finally {}
  }
}
