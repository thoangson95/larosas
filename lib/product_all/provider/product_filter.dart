import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitrang/product_filter/provider/product_filter.dart';
import '../model/product_model.dart';
import '../repository/repository.dart';

class ProductAllState {
  final List<ProductModel>? listProducts;
  bool? isLoading;

  ProductAllState({this.listProducts, this.isLoading = true});

  ProductAllState copyWith(
      {List<ProductModel>? listProducts, bool? isLoading}) {
    return ProductAllState(
        isLoading: isLoading ?? this.isLoading,
        listProducts: listProducts ?? this.listProducts);
  }
}

class ProductAllControler extends StateNotifier<ProductAllState> {
  ProductAllControler(this.productFilterProviders) : super(ProductAllState());

  final ProductFilterState productFilterProviders;

  init(String url) async {
    var urlFilter = [];
    if (productFilterProviders.priceMax != null &&
        productFilterProviders.priceMin != null) {
      urlFilter.add(
          "price=${productFilterProviders.priceMin}-${productFilterProviders.priceMax}");
    }
    if (productFilterProviders.rating != null) {
      urlFilter.add("rating=${productFilterProviders.rating}");
    }
    final urlFilterString = urlFilter.join('&').toString();
    if (urlFilterString.isNotEmpty) url = '$url?$urlFilterString';
    final List<ProductModel>? items = await fetchProducts(url);
    state = state.copyWith(listProducts: items, isLoading: false);
  }

  Future<List<ProductModel>?> fetchProducts(String url) async {
    try {
      final response = await apiProvider.get(url);

      if (response.statusCode == 200) {
        List<ProductModel>? newList = [];
        final data = json.decode(response.data) as List<dynamic>;
        for (var product in data) {
          newList.add(ProductModel.fromJson(product));
        }
        return newList;
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print(error);
    }
    return null;
  }

  void toggleFavorite(int id, String like) async {
    state = state.copyWith(isLoading: true);
    if (like.isNotEmpty) {
      List<ProductModel> newList = [];
      for (var element in state.listProducts!) {
        if (int.parse(element.id.toString()) == id) {
          element = element.copyWith(status: '');
        }
        newList.add(element);
      }
      await putData('/product', {'id': id, 'like': ''});
      state = state.copyWith(listProducts: newList, isLoading: false);
    } else {
      List<ProductModel> newList = [];
      for (var element in state.listProducts!) {
        if (int.parse(element.id.toString()) == id) {
          element = element.copyWith(status: 'like');
        }
        newList.add(element);
      }
      await putData('/product', {'id': id, 'like': 'like'});
      state = state.copyWith(listProducts: newList, isLoading: false);
    }
  }
}

final productAllProviders =
    StateNotifierProvider<ProductAllControler, ProductAllState>(
  (ref) {
    final productFilterProvider = ref.watch(productFilterProviders);
    return ProductAllControler(productFilterProvider);
  },
);

final productAllFavoriteProviders =
    StateNotifierProvider.autoDispose<ProductAllControler, ProductAllState>(
  (ref) {
    final productFilterProvider = ref.watch(productFilterProviders);
    return ProductAllControler(productFilterProvider);
  },
);
