import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/waiting_screen.dart';


class LayoutWaiting extends StatelessWidget {
  const LayoutWaiting({super.key});

  static String pathRoute = '/order';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const WaitingScreen(),
      );
  // static GoRoute goRoute() => GoRoute(path: pathRoute);
  @override
  Widget build(BuildContext context) {
    return const WaitingScreen();
  }
}
