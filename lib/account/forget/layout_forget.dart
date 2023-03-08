import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/forget_screen.dart';

class LayoutForget extends StatelessWidget {
  const LayoutForget({super.key});

  static String pathRoute = '/forget';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const ForgetScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const ForgetScreen();
  }
}
