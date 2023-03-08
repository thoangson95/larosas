import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/register_screen.dart';

class LayoutRegister extends StatelessWidget {
  const LayoutRegister({super.key});

  static String pathRoute = '/register';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const RegisterScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const RegisterScreen();
  }
}
