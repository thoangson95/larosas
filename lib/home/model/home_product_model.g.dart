// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'home_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeProductModel _$$_HomeProductModelFromJson(Map<String, dynamic> json) =>
    _$_HomeProductModel(
      id: json['id'] as String,
      code: json['code'] as String,
      namevi: json['namevi'] as String,
      descvi: json['descvi'] as String,
      photo: json['photo'] as String,
      regularPrice: json['regularPrice'] as String,
      salePrice: json['salePrice'] as String,
      discount: json['discount'] as String,
      status: json['status'] as String,
      idList: json['idList'] as String,
    );

Map<String, dynamic> _$$_HomeProductModelToJson(_$_HomeProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'namevi': instance.namevi,
      'descvi': instance.descvi,
      'photo': instance.photo,
      'regularPrice': instance.regularPrice,
      'salePrice': instance.salePrice,
      'discount': instance.discount,
      'status': instance.status,
      'idList': instance.idList,
    };
