import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpService {
  Map<String, String> headers = {
    "content-Type": "application/json",
  };

  Future<dynamic> get(String url) async {
    dynamic responseJson;
    dynamic response;

    try {
      Response response = await http.get(Uri.parse(url), headers: headers);
      responseJson = jsonDecode(response.body);
    } catch (e) {
      throw Exception('Something went wrong.');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    dynamic responseJson;
    dynamic response;

    try {
      response = await http.post(Uri.parse(url), body: body, headers: headers);

      responseJson = jsonDecode(response.body);
    } catch (e) {
      throw Exception('Something went wrong.');
    }

    return responseJson;
  }
}
