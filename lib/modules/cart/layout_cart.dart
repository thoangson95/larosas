import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/cart_screen.dart';

class LayoutCart extends StatelessWidget {
  const LayoutCart({Key? key}) : super(key: key);

  static String pathRoute = '/cart';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const CartScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const CartScreen();
  }
}
