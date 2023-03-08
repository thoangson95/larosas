import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/product_all_screen.dart';

class LayoutProductAll extends StatelessWidget {
  const LayoutProductAll({super.key, required this.id});

  final String id;

  static String pathRoute = '/product-all';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const ProductAllScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const ProductAllScreen();
  }
}
