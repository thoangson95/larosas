import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/home_model.dart';
import '../repository/home_repository.dart';

class HomeState {
  final List<HomeModel>? listData;
  final bool isLoading;

  HomeState({this.listData, this.isLoading = true});

  HomeState copyWith({List<HomeModel>? listData, bool? isLoading}) {
    return HomeState(
        isLoading: isLoading ?? this.isLoading,
        listData: listData ?? this.listData);
  }
}

class HomeControler extends StateNotifier<HomeState> {
  HomeControler() : super(HomeState()) {
    _init();
  }

  _init() async {
    final List<HomeModel>? a = await HomeRepository.homeInfo();
    state = state.copyWith(listData: a);
  }
}

final homeProviders = StateNotifierProvider<HomeControler, HomeState>(
  (ref) => HomeControler(),
);
