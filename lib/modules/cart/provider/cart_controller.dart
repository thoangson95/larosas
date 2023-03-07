import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:larosas/modules/cart/model/cart_model.dart';
import 'package:larosas/modules/cart/respository/cart_repository.dart';

import 'cart_state.dart';

class CartController {
  final CartRepository repo;
  CartController({required this.repo});
  Future<List<CartModel>> reloadCart(String listID) async {
    try {
      final res = await repo.reloadCartAPI(listID);
      final listProductCart = (jsonDecode(res) as List).map((e) => CartModel.fromJson(e)).toList();
      return listProductCart;
    } on DioError {
      rethrow;
    }
  }
}

final cartDio = Provider((ref) => Dio());

final cartState = ChangeNotifierProvider((ref) => CartState(ref: ref));

final cartRepoProvider = Provider((ref) => CartRepository(dio: ref.watch(cartDio)));

final cartControllerProvider = Provider((ref) => CartController(repo: ref.read(cartRepoProvider)));

final cartFutureRecheckProvider = FutureProvider((ref) => ref.watch(cartState.notifier).reCheckCart());
