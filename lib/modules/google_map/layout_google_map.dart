import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/google_map_screen.dart';

class LayoutGoogleMap extends StatelessWidget {
  const LayoutGoogleMap({Key? key}) : super(key: key);

  static String pathRoute = '/google-map';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const GoogleMapScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const GoogleMapScreen();
  }
}
