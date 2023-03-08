import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'home_product_model.freezed.dart';
part 'home_product_model.g.dart';

@freezed
class HomeProductModel with _$HomeProductModel {
  const factory HomeProductModel({
    required String id,
    required String code,
    required String namevi,
    required String descvi,
    required String photo,
    required String regularPrice,
    required String salePrice,
    required String discount,
    required String status,
    required String idList,
  }) = _HomeProductModel;

  factory HomeProductModel.fromJson(Map<String, Object?> json) =>
      _$HomeProductModelFromJson(json);
}
