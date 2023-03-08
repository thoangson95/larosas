import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screen/forget_code_screen.dart';

class LayoutForgetCode extends StatelessWidget {
  const LayoutForgetCode({super.key});

  static String pathRoute = '/forget-code';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const ForgetCodeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const ForgetCodeScreen();
  }
}
