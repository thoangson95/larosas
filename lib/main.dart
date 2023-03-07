import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'constants.dart';
import 'modules/order/layout_order.dart';
import 'modules/waiting/layout_order.dart';
import 'modules/waiting/screen/waiting_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    LayoutOrder.goRoute(),
    LayoutWaiting.goRoute(),
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
      builder: (context, child) => WaitingScreen(),
    );
  }
}
