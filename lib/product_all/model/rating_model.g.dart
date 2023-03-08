// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RatingModel _$$_RatingModelFromJson(Map<String, dynamic> json) =>
    _$_RatingModel(
      sao: json['sao'] as String,
      solan: json['solan'] as String,
      imei: (json['imei'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_RatingModelToJson(_$_RatingModel instance) =>
    <String, dynamic>{
      'sao': instance.sao,
      'solan': instance.solan,
      'imei': instance.imei,
    };
