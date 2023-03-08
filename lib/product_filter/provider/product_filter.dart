import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductFilterState {
  final double? rating;
  final double? priceMin;
  final double? priceMax;
  bool? isLoading;

  ProductFilterState(
      {this.rating, this.priceMin, this.priceMax, this.isLoading = true});

  ProductFilterState copyWith(
      {double? rating, double? priceMin, double? priceMax, bool? isLoading}) {
    return ProductFilterState(
      isLoading: isLoading ?? this.isLoading,
      rating: rating ?? rating,
      priceMin: priceMin ?? priceMin,
      priceMax: priceMax ?? priceMax,
    );
  }
}

class ProductFilterControler extends StateNotifier<ProductFilterState> {
  ProductFilterControler() : super(ProductFilterState());

  void handleFilter({double? rating, double? priceMin, double? priceMax}) {
    state = state.copyWith(
        rating: rating ?? state.rating,
        priceMin: priceMin ?? state.priceMin,
        priceMax: priceMax ?? state.priceMax);
  }
}

final productFilterProviders =
    StateNotifierProvider<ProductFilterControler, ProductFilterState>(
        (ref) => ProductFilterControler());
