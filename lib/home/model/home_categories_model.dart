import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'home_categories_model.freezed.dart';
part 'home_categories_model.g.dart';

@freezed
class HomeCategoriesModel with _$HomeCategoriesModel {
  const factory HomeCategoriesModel({
    required String id,
    required String namevi,
    required String photo,
  }) = _HomeCategoriesModel;

  factory HomeCategoriesModel.fromJson(Map<String, Object?> json) =>
      _$HomeCategoriesModelFromJson(json);
}
