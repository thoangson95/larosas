// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      photo: json['photo'] as String,
      regular_price: json['regular_price'] as String,
      sale_price: json['sale_price'] as String,
      discount: json['discount'] as String,
      status: json['status'] as String,
      id_list: json['id_list'] as String,
      gallery:
          (json['gallery'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'regular_price': instance.regular_price,
      'sale_price': instance.sale_price,
      'discount': instance.discount,
      'status': instance.status,
      'id_list': instance.id_list,
      'gallery': instance.gallery,
    };
