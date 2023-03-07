import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/home_product_model.dart';
import '../repository/home_repository.dart';

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

  void toggleFavorite(id) async {
    // ignore: avoid_print
    print(id);
  }
}

final homeProductProviders =
    StateNotifierProvider<HomeProductControler, HomeProductState>(
  (ref) => HomeProductControler(),
);
