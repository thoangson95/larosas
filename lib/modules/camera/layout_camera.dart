import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/camera_screen.dart';

class LayoutCamera extends StatelessWidget {
  const LayoutCamera({Key? key}) : super(key: key);

  static String pathRoute = '/camera';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const CameraScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const CameraScreen();
  }
}
