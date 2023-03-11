import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/loading/provider/loading_provider.dart';
import '../../constants.dart';
import '../../login/provider/login_state.dart';
import '../../register/provider/register_controller.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        accesstoken().then((value) {
          if (value != null) {
            loginfb().then(
              (value) {
                if (value!.token.isNotEmpty) {
                  userinfo().then((value1) {
                    ref.read(facebookuserState.notifier).state =
                        jsonEncode(value1);
                    GoRouter.of(context).go('/home');
                  });
                } else {
                  GoRouter.of(context).go('/login');
                }
              },
            );
          } else {
            GoRouter.of(context).go('/login');
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorMain,
      body: SizedBox(
        width: double.infinity,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: _animationController.value,
                  child: Image.asset('assets/images/logo_loading.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: defaultPadding / 2),
                  child: Text(
                    'La Rosa’s',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'UA',
                      fontSize: 26,
                    ),
                  ),
                )
              ],
            );
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
