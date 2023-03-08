import 'package:freezed_annotation/freezed_annotation.dart';
import '../../product_detail/model/rating_model.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String name,
    required String photo,
    required String regular_price,
    required String sale_price,
    required String discount,
    required String status,
    required String id_list,
    required List<String> gallery,
    @Default([]) List<RatingModel> rating,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);
}
