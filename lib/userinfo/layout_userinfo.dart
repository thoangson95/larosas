import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/userinfo/screen/userinfo_screen.dart';

class LayoutUserInfo extends StatelessWidget {
  const LayoutUserInfo({super.key});

  static String pathRoute = '/userinfo';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const UserInfoScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const UserInfoScreen();
  }
}
