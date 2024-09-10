import 'dart:convert';

import 'package:dio/dio.dart';

import '../repos/response.dart';

class CounterServices {

  static Future<Object> onGetDummyData() async {
    try {
      // var response = await _configureDio(baseUrl: Constants.serviceURL(server: server)).request('/', data: formData, options: Options(method: 'POST')); // same sa  below
      var response = await _configureDio(baseUrl: 'https://jsonplaceholder.typicode.com').get(
        '/posts',
      );

      if (response.statusCode == 200) {
        String str = _convertJson(object: response.data);
        return Success(code: 200, response: response.data);
      }
      return Failure(code: 500, response: "Error");
    } catch (e) {
      // catch error
      return Failure(code: 100, response: "Error");
    }
  }

  static Dio _configureDio({
    required String baseUrl,
  }) {
    final dio = Dio();
    final options = BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      responseType: ResponseType.plain,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio.options = options;
    return dio;
  }

  static String _convertJson({
    required Object? object,
  }) {
    JsonEncoder json = const JsonEncoder();
    return json.convert(object);
  }

  static genParModelFromJson(data) {}
}