import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://hrws.dexef.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    @required String? url,
    // @required Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'ip': '192.168.195.216',
      'database': 'Hassan',
      'category_id': 1,
      'report_name': 'general_category_trans',
      'from': '2010-01-01',
      'to': '2020-12-31',
    };
    return await dio!.get(
      url!,
      //  queryParameters: query,
    );
  }
}
