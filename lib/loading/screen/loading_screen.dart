import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../home/layout_home.dart';
import '../../constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).go(LayoutHome.pathRoute);
    });
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
