import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://hrws.dexef.com/Dexef_HR_WebService.asmx/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    @required String? url,
    @required Map<String, dynamic>? query,
  }) async {
    return await dio!.get(
      url!,
      queryParameters: query,
    );
  }
}
