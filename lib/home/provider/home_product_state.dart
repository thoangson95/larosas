// ignore_for_file: avoid_print
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../model/home_product_model.dart';
import '../repository/home_repository.dart';

class FavoriteProducts {
  static const _boxName = 'favorite_products';

  Future<void> addFavorite(String id) async {
    late final Box box;
    box = Hive.box(_boxName);

    if (!box.values.contains(id)) {
      box.add(id);
    }
  }

  Future<bool> isFavorite(String id) async {
    final Box box;
    box = Hive.box(_boxName);
    if (box.values.contains(id)) {
      return true;
    } else {
      return false;
    }
  }
}

class HomeProductState {
  final List<HomeProductModel>? listProducts;
  final bool isLoading;

  HomeProductState({this.listProducts, this.isLoading = true});

  HomeProductState copyWith(
      {List<HomeProductModel>? listProducts, bool? isLoading}) {
    return HomeProductState(
        isLoading: isLoading ?? this.isLoading,
        listProducts: listProducts ?? this.listProducts);
  }
}

class HomeProductControler extends StateNotifier<HomeProductState> {
  HomeProductControler() : super(HomeProductState()) {
    _init();
  }

  _init() async {
    final List<HomeProductModel>? a = await HomeRepository.homeProduct();
    state = state.copyWith(listProducts: a);
  }
}

final homeProductProviders =
    StateNotifierProvider<HomeProductControler, HomeProductState>(
  (ref) => HomeProductControler(),
);

final favProductProviders =
    StateNotifierProvider<HomeProductControler, HomeProductState>(
  (ref) => HomeProductControler(),
);
