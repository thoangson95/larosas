import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/userinfo/screen/userinfo_screen.dart';

import 'screen/edituser_screen.dart';
import 'screen/viewavatar_screen.dart';

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

class LayoutCamera extends StatelessWidget {
  const LayoutCamera({super.key});

  static String pathRoute = '/camera';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => Camera(),
      );

  @override
  Widget build(BuildContext context) {
    return Camera();
  }
}
class LayoutViewAvatar extends StatelessWidget {
  const LayoutViewAvatar({super.key});

  static String pathRoute = '/viewavatar';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const ViewAvatar(),
      );

  @override
  Widget build(BuildContext context) {
    return const ViewAvatar();
  }
}
