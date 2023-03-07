import 'dart:convert';
import 'package:dio/dio.dart';

import '../model/home_model.dart';
import '../model/home_banner_model.dart';
import '../model/home_categories_model.dart';
import '../model/home_product_model.dart';

class HomeRepository {
  static const String _baseUrl =
      'https://demo55.ninavietnam.com.vn/flutter/api';
  static final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  static Future<List<HomeProductModel>?> homeProduct() async {
    final response = await _dio.get('/product');
    final data = json.decode(response.data) as List<dynamic>;
    List<HomeProductModel> listProducts = [];
    if (response.statusCode == 200) {
      for (var e in data) {
        listProducts.add(HomeProductModel.fromJson(e));
      }
      return listProducts;
    } else {
      throw Exception('Failed to load Product');
    }
  }

  static Future<List<HomeBannerModel>?> homeBanner() async {
    final response = await _dio.get('/banner');
    final data = json.decode(response.data) as List<dynamic>;
    List<HomeBannerModel>? listBanner = [];
    if (response.statusCode == 200) {
      for (var e in data) {
        listBanner.add(HomeBannerModel.fromJson(e));
      }
      return listBanner;
    } else {
      throw Exception('Failed to load Banner');
    }
  }

  static Future<List<HomeCategoriesModel>?> homeCategories() async {
    final response = await _dio.get('/categories');
    final data = json.decode(response.data) as List<dynamic>;

    List<HomeCategoriesModel>? listCategories = [];
    if (response.statusCode == 200) {
      for (var e in data) {
        listCategories.add(HomeCategoriesModel.fromJson(e));
      }
      return listCategories;
    } else {
      throw Exception('Failed to load Categories');
    }
  }

  static Future<List<HomeModel>?> homeInfo() async {
    final response = await _dio.get('/app-info');
    final data = json.decode(response.data) as List<dynamic>;
    List<HomeModel>? listData = [];
    if (response.statusCode == 200) {
      for (var e in data) {
        listData.add(HomeModel.fromJson(e));
      }
      return listData;
    } else {
      throw Exception('Failed to load Categories');
    }
  }
}
