import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/home_categories_model.dart';
import '../repository/home_repository.dart';

class HomeCategoriesState {
  final List<HomeCategoriesModel>? listCategories;
  final bool isLoading;

  HomeCategoriesState({this.listCategories, this.isLoading = true});

  HomeCategoriesState copyWith(
      {List<HomeCategoriesModel>? listCategories, bool? isLoading}) {
    return HomeCategoriesState(
        isLoading: isLoading ?? this.isLoading,
        listCategories: listCategories ?? this.listCategories);
  }
}

class HomeCategoriesControler extends StateNotifier<HomeCategoriesState> {
  HomeCategoriesControler() : super(HomeCategoriesState()) {
    _init();
  }

  _init() async {
    final List<HomeCategoriesModel>? a = await HomeRepository.homeCategories();
    state = state.copyWith(listCategories: a);
  }
}

final homeCategoriesProviders =
    StateNotifierProvider<HomeCategoriesControler, HomeCategoriesState>(
  (ref) => HomeCategoriesControler(),
);
