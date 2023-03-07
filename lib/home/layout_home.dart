import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screen/home_screen.dart';

class LayoutHome extends StatelessWidget {
  const LayoutHome({super.key});

  static String pathRoute = '/';
  static GoRoute goRoute() => GoRoute(path: pathRoute);

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
