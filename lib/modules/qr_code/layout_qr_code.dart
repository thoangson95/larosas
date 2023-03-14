import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/qr_code_screen.dart';

class LayoutQrCode extends StatelessWidget {
  const LayoutQrCode({Key? key}) : super(key: key);

  static String pathRoute = '/qr-code';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const QrCodeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const QrCodeScreen();
  }
}
