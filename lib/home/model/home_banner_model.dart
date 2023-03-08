import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'home_banner_model.freezed.dart';
part 'home_banner_model.g.dart';

@freezed
class HomeBannerModel with _$HomeBannerModel {
  const factory HomeBannerModel({
    required String id,
    required String namevi,
    required String photo,
  }) = _HomeBannerModel;

  factory HomeBannerModel.fromJson(Map<String, Object?> json) =>
      _$HomeBannerModelFromJson(json);
}
