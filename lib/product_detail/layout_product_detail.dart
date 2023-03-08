import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/product_detail_screen.dart';

class LayoutProductDeatil extends StatelessWidget {
  const LayoutProductDeatil({super.key, required this.id});

  final String id;

  static String pathRoute = '/product-detail';
  static GoRoute goRoute() => GoRoute(
        path: "$pathRoute/:id",
        builder: (context, state) {
          return LayoutProductDeatil(
            id: state.params['id'].toString(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return ProductDetailPage(id: id);
  }
}
