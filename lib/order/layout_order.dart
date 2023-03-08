import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/order_screen.dart';


class LayoutOrder extends StatelessWidget {
  const LayoutOrder({super.key});

  static String pathRoute = '/order';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const HomeOrder(),
      );
  // static GoRoute goRoute() => GoRoute(path: pathRoute);
  @override
  Widget build(BuildContext context) {
    return const HomeOrder();
  }
}
