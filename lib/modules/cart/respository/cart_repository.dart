import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class CartRepository {
  final Dio dio;

  CartRepository({required this.dio});

  Future<String> reloadCartAPI(String listID) async {
    try {
      final res = await dio.post("http://demo80.ninavietnam.com.vn/test_app_api/api/product_api.php",
          data: {
            'type': "reloadCart",
            'listID': listID,
          },
          options: Options(headers: {
            HttpHeaders.acceptHeader: "json/application/json",
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          }));
      return res.data;
    } on DioError {
      rethrow;
    }
  }

  Future<bool> saveCartAPI(String param) async {
    try {
      final res = await dio.post("http://demo80.ninavietnam.com.vn/test_app_api/api/product_api.php",
          data: {
            'type': "saveCart",
            'listProduct': param,
          },
          options: Options(headers: {
            HttpHeaders.acceptHeader: "json/application/json",
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          }));
      // print(res.data);
      return jsonDecode(res.data);
    } on DioError {
      rethrow;
    }
  }
}
