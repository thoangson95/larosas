import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'constants.dart';

void main() {
  const ProviderScope(
    child: MyApp(),
  );
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    // LayoutLoading.goRoute(),
    // LayoutHome.goRoute(),
    // LayoutProductDeatil.goRoute(),
    // LayoutLogin.goRoute(),
    // LayoutRegister.goRoute(),
    // LayoutForget.goRoute(),
    // LayoutForgetCode.goRoute()
  ],
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Larosas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'UA',
        primaryColor: colorMain,
      ),
      routerConfig: _router,
      builder: (context, child) => child!,
    );
  }
}