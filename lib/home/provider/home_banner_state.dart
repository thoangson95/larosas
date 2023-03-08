import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/home_banner_model.dart';
import '../repository/home_repository.dart';

class HomeBannerState {
  final List<HomeBannerModel>? listBanner;
  final bool isLoading;

  HomeBannerState({this.listBanner, this.isLoading = true});

  HomeBannerState copyWith(
      {List<HomeBannerModel>? listBanner, bool? isLoading}) {
    return HomeBannerState(
        isLoading: isLoading ?? this.isLoading,
        listBanner: listBanner ?? this.listBanner);
  }
}

class HomeBannerControler extends StateNotifier<HomeBannerState> {
  HomeBannerControler() : super(HomeBannerState()) {
    _init();
  }

  _init() async {
    final List<HomeBannerModel>? a = await HomeRepository.homeBanner();
    state = state.copyWith(listBanner: a);
  }
}

final homeBannerProviders =
    StateNotifierProvider<HomeBannerControler, HomeBannerState>(
  (ref) => HomeBannerControler(),
);
