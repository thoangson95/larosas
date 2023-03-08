import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../model/product_model.dart';
import '../product_detail_screen.dart';

class PicWidget extends StatelessWidget {
  const PicWidget({
    super.key,
    required this.gallerys,
    required this.widget,
    required this.product,
  });

  final List<String> gallerys;
  final ProductDetailPage widget;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoViewGallery.builder(
              itemCount: gallerys.length,
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(gallerys[index]),
                  initialScale: PhotoViewComputedScale.contained * 0.8,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 1.1,
                );
              },
              scrollPhysics: const BouncingScrollPhysics(),
            ),
          ),
        );
      },
      child: Hero(
        tag: widget.id,
        child: Image.network(
          product.photo,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Image.asset('assets/images/spacer.png');
          },
        ),
      ),
    );
  }
}
