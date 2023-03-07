import 'package:flutter/material.dart';


class WaitingModel {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  WaitingModel({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<WaitingModel> orders = [
  WaitingModel(
      id: 1,
      title: "Áo thun nữ thời trang",
      price: 350000,
      size: 12,
      description: dummyText,
      image: "assets/images/product2.png",
      color: Color(0xFF3D82AE)),
  WaitingModel(
      id: 2,
      title: "Belt Bag",
      price: 585000,
      size: 8,
      description: dummyText,
      image: "assets/images/product3.png",
      color: Color(0xFFD3A984)),

  WaitingModel(
    id: 6,
    title: "Áo thun nữ thời trang ",
    price: 234000,
    size: 12,
    description: dummyText,
    image: "assets/images/product4.png",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "- Sản phẩm: SET ASHE W SKIRT "
    "- Màu sắc: Hồng nhạt, kem, đen, xám , đỏ "
    "- Màu sắc: Hồng nhạt, kem, đen, xám , đỏ "
    "- Màu sắc: Hồng nhạt, kem, đen, xám , đỏ "
    "- Màu sắc: Hồng nhạt, kem, đen, xám , đỏ "
    "- Chất vải: Cotton hàn";
