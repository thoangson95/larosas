import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:larosas/modules/product_detail/screen/prodcut_detail_screen.dart';

class LayoutProductDetail extends StatelessWidget {
  const LayoutProductDetail({Key? key}) : super(key: key);

  static String pathRoute = '/prodcut-detail';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const ProdcutDetailScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const ProdcutDetailScreen();
  }
}
