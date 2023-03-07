import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel extends HiveObject {
  @HiveField(0)
  late int qty;
  @HiveField(1)
  late bool selected;
  @HiveField(2)
  late String name;
  @HiveField(3)
  late int price;
  @HiveField(4)
  late String photo;
  @HiveField(5)
  late int productId;

  CartModel({
    this.qty = 0,
    this.selected = false,
    this.name = "",
    this.price = 0,
    this.productId = 0,
    this.photo = "",
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    qty = json['qty'] ?? 0;
    selected = json['selected'] ?? false;
    name = json['name'] ?? "";
    price = json['price'] ?? 0;
    productId = json['productId'] ?? 0;
    photo = json['photo'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['qty'] = qty;
    // data['selected'] = selected;
    // data['name'] = name;
    // data['price'] = price;
    data['productId'] = productId;
    // data['photo'] = photo;
    return data;
  }
}
