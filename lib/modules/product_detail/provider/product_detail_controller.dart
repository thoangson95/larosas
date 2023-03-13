import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/product_detail_model.dart';

class ProductDetailController {
  final Dio dio;
  ProductDetailController(this.dio);

  Future<ProductDetailModel> fetchProductDetail(int id) async {
    try {
      final res = await dio.get(
        "http://demo80.ninavietnam.com.vn/test_app_api/api/product_api.php?type=getOneProduct&id=$id",
      );
      return ProductDetailModel.fromJson(jsonDecode(res.data));
    } on DioError {
      rethrow;
    }
  }
}

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final productDetailIdProvier = StateProvider<int>((ref) => 39);

final productDetailProvider = FutureProvider<ProductDetailModel>((ref) => ProductDetailController(ref.watch(dioProvider)).fetchProductDetail(ref.watch(productDetailIdProvier)));
