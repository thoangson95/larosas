import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/redeemcode/screen/redeemcode_screen.dart';

class LayoutRedeemCode extends StatelessWidget {
  const LayoutRedeemCode({super.key});

  static String pathRoute = '/redeemcode/:number';
  static GoRoute goRoute() => GoRoute(
    name: "redeemcode",
        path: pathRoute,
        builder: (context, state) => RedemcodeScreen(phonenumber: state.params['number']!,),
      );

  @override
  Widget build(BuildContext context) {
    return const RedemcodeScreen(phonenumber: '',);
  }
}
