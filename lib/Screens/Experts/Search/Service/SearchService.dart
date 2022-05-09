import 'dart:convert';
import 'dart:developer';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;

import '../../../../Model/Matches_Model/Searchmodel.dart';

class ApiServices {

  RxList list=[].obs;

  static Future<Profile?> login(  {required String value,  required int page}) async {

    try {

      final url = Uri.parse("https://api.freefantasy.in/tips/tipsters?count=1&pagelimit=25");

      print("${url}");


      final body = {"pageIndex": 1, "searchText": value, "returnedRecords": 25};

      final headers = {"Content-Type": "application/json"};

      final response = await http.post(url, headers: headers, body: jsonEncode(body));

      log("---------yyyyyyyyyyy-----${response.body}");

      if (response.statusCode == 200) {

        print("successfully");

        log(response.statusCode.toString());

        final Profile profile = Profile.fromJson(jsonDecode(response.body));

        return profile;
      }

    } catch (e, st) {

      print("failed ----------------- $e ,$st");

    }


  }
}
