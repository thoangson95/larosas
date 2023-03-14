import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/pdf_screen.dart';

class LayoutPdf extends StatelessWidget {
  const LayoutPdf({Key? key}) : super(key: key);

  static String pathRoute = '/pdf';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) => const PdfScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const PdfScreen();
  }
}
