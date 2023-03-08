import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/product_filter_screen.dart';

class LayoutProductFilter extends StatelessWidget {
  const LayoutProductFilter({super.key, required this.id});

  final String id;

  static String pathRoute = '/product-filter';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const ProductFilterScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const ProductFilterScreen();
  }
}
