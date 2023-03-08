import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/forgotpassword_screen.dart';

class LayoutForgotPassword extends StatelessWidget {
  const LayoutForgotPassword({super.key});

  static String pathRoute = '/forgotpassword';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const FogotpasswordScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const FogotpasswordScreen();
  }
}
