import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/cart_detail_screen.dart';

class LayoutCartDetail extends StatelessWidget {
  const LayoutCartDetail({Key? key}) : super(key: key);

  static String pathRoute = '/cart-detail';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => CartDetailScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return CartDetailScreen();
  }
}
