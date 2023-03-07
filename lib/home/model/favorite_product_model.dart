import 'package:hive/hive.dart';

part 'favorite_product_model.g.dart';

@HiveType(typeId: 0)
class FavoriteProductModel {
  @HiveField(0)
  final String id;

  FavoriteProductModel({required this.id});

  void delete() {}
}
