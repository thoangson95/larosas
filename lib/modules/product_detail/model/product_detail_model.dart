class ProductDetailModel {
  late int id;
  late String photo;
  late String descvi;
  late String namevi;
  late int regularPrice;
  // late List<Gallery> gallery;

  ProductDetailModel({
    this.id = 0,
    this.photo = "",
    this.descvi = "",
    this.namevi = "",
    this.regularPrice = 0,
    //  this.gallery = const []
  });

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    descvi = json['descvi'];
    namevi = json['namevi'];
    regularPrice = json['regular_price'];
    // if (json['gallery'] != null) {
    //   gallery = <Gallery>[];
    //   json['gallery'].forEach((v) {
    //     gallery.add(Gallery.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['photo'] = photo;
    data['descvi'] = descvi;
    data['namevi'] = namevi;
    data['regular_price'] = regularPrice;
    // data['gallery'] = gallery.map((v) => v.toJson()).toList();
    return data;
  }
}

class Gallery {
  late String photo;

  Gallery({this.photo = ""});

  Gallery.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photo'] = photo;
    return data;
  }
}
