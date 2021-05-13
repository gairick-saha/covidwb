import 'dart:convert';
import 'package:covidwb/constants/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Api {
  static Api _instance = Api.internal();
  Api.internal();
  factory Api() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();
  final baseUrl = R.baseUrl + "/";

  Future<dynamic> get(String url) async {
    return http
        .get(
      Uri.parse(baseUrl + url),
    )
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        Get.snackbar(
          'error',
          'Error Fetching Data',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      return _decoder.convert(res);
    });
  }
}
