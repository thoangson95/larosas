import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platform_device_id/platform_device_id.dart';
import '../../home/provider/product_home_provider.dart';
import '../../loading/screen/widget/loading_widget.dart';
import '../model/product_model.dart';
import '../repository/repository.dart';

class ProductDetailState {
  final List<ProductModel>? listProducts;
  bool? isLoading;

  ProductDetailState({this.listProducts, this.isLoading = true});

  ProductDetailState copyWith(
      {List<ProductModel>? listProducts, bool? isLoading}) {
    return ProductDetailState(
        isLoading: isLoading ?? this.isLoading,
        listProducts: listProducts ?? this.listProducts);
  }
}

class ProductDetailControler extends StateNotifier<ProductDetailState> {
  ProductDetailControler() : super(ProductDetailState());

  init(String url) async {
    final List<ProductModel>? items = await fetchProducts(url);
    state = state.copyWith(listProducts: items, isLoading: false);
  }

  Future<List<ProductModel>?> fetchProducts(String url) async {
    final response = await apiProvider.get(url);
    final data = json.decode(response.data) as List<dynamic>;
    List<ProductModel>? newList = [];
    for (var product in data) {
      newList.add(ProductModel.fromJson(product));
    }
    return newList;
  }

  void toggleFavorite(int id, String like, WidgetRef ref) async {
    final List<ProductModel>? items = await fetchProducts('/product?id=$id');
    state = state.copyWith(isLoading: true);
    ref.read(isLoadingProvider.notifier).state = true;
    List<ProductModel> newList = [];
    if (like.isNotEmpty) {
      newList.add(items!.first.copyWith(status: ''));
      await putData('/product', {'id': id, 'like': ''});
      ref.read(productHomeProviders.notifier).toggleFavorite(id, 'like');
    } else {
      newList.add(items!.first.copyWith(status: 'like'));
      await putData('/product', {'id': id, 'like': 'like'});
      ref.read(productHomeProviders.notifier).toggleFavorite(id, '');
    }
    state = state.copyWith(listProducts: newList, isLoading: false);
    ref.read(isLoadingProvider.notifier).state = false;
  }

  void handleRating(
      String idProduct, String star, String imei, WidgetRef ref) async {
    state = state.copyWith(isLoading: true);

    if (star.isNotEmpty) {
      print(imei);
      await putData(
        '/product',
        {
          "id_product": idProduct,
          "star": star,
          "imei": [imei],
        },
      );
      init('/product?id=$idProduct');
      ref.read(isLoadingProvider.notifier).state = false;
    }
  }
}

final productDetailProviders =
    StateNotifierProvider<ProductDetailControler, ProductDetailState>(
        (ref) => ProductDetailControler());

final productDetailFavoriteProviders = StateNotifierProvider.autoDispose<
    ProductDetailControler,
    ProductDetailState>((ref) => ProductDetailControler());

final productDetailRatingProviders = StateNotifierProvider.autoDispose<
    ProductDetailControler,
    ProductDetailState>((ref) => ProductDetailControler());

// final imeiListProvider = StateProvider<String>((ref) => '');
// final imeiListProvider = StateProvider<String>((ref) => '');
final imeiListProvider = FutureProvider<String>((ref) async {
  final result = await PlatformDeviceId.getDeviceId;
  return result.toString();
});
