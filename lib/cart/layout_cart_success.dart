import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/cart_success_screen.dart';

class LayoutCartSuccess extends StatelessWidget {
  const LayoutCartSuccess({Key? key}) : super(key: key);

  static String pathRoute = '/cart-success';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const CartSuccessScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const CartSuccessScreen();
  }
}
