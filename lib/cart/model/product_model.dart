class ProductModel {
  late int id;
  late String namevi;
  late int regularPrice;

  ProductModel({
    this.id = 0,
    this.namevi = "",
    this.regularPrice = 0,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namevi = json['namevi'];
    regularPrice = json['regular_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['namevi'] = namevi;
    data['regular_price'] = regularPrice;
    return data;
  }
}
