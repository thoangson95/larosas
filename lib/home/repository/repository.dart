import '../model/product_model.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class ApiProvider {
  Dio _dio = Dio();

  ApiProvider() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://192.168.1.35/api/',
    );

    _dio = Dio(options);
  }

  Future<dynamic> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> put(String url, dynamic data) async {
    try {
      final response = await _dio.put(url, data: data);
      return jsonDecode(response.toString());
    } catch (e) {
      return e;
    }
  }
}

final apiProvider = ApiProvider();

Future<List<ProductModel>> resultData(String url) async {
  final List<ProductModel> list = [];
  final data = await apiProvider.get(url);
  var dataProducts = data as List;
  for (var element in dataProducts) {
    list.add(ProductModel.fromJson(element));
  }
  return list;
}

Future<List<ProductModel>> fetchData(String url) async {
  final List<ProductModel> list = [];
  final data = await apiProvider.get(url);
  var dataProducts = data as List;
  for (var element in dataProducts) {
    list.add(ProductModel.fromJson(element));
  }
  return list;
}

Future<String> putData(String url, dynamic data) async {
  final response = await apiProvider.put(url, data);
  return response.toString();
}
