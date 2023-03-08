import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/login_screen.dart';

class LayoutLogin extends StatelessWidget {
  const LayoutLogin({super.key});

  static String pathRoute = '/login';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const LoginScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
