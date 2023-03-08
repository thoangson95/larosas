import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
class HomeModel with _$HomeModel {
  const factory HomeModel({
    required String namevi,
    required String logo,
    required String slogan,
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, Object?> json) =>
      _$HomeModelFromJson(json);
}
