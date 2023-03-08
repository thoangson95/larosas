import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/loading_screen.dart';

class LayoutLoading extends StatelessWidget {
  const LayoutLoading({super.key});

  static String pathRoute = '/';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const LoadingScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const LoadingScreen();
  }
}
