import 'package:freezed_annotation/freezed_annotation.dart';
part 'rating_model.freezed.dart';
part 'rating_model.g.dart';

@freezed
class RatingModel with _$RatingModel {
  const factory RatingModel({
    required String sao,
    required String solan,
    required List<String> imei,
  }) = _RatingModel;

  factory RatingModel.fromJson(Map<String, Object?> json) =>
      _$RatingModelFromJson(json);
}
