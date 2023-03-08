import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/registerscreen.dart';

class LayoutRegister extends StatelessWidget {
  const LayoutRegister({super.key});

  static String pathRoute = '/register';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => RegisterScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return RegisterScreen();
  }
}
