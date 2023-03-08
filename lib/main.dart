import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';
import 'modules/cart/layout_cart.dart';
import 'modules/cart/layout_cart_detail.dart';
import 'modules/cart/layout_cart_success.dart';
import 'modules/cart/model/cart_model.dart';
import 'modules/product_detail/layout_product_detail.dart';
import 'modules/order/layout_order.dart';
import 'modules/waiting/layout_order.dart';
import 'modules/waiting/screen/waiting_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(CartModelAdapter());
  await Hive.openBox<CartModel>('CartBox');

  runApp(const ProviderScope(child: MyApp()));
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
    LayoutCart.goRoute(),
    LayoutProductDetail.goRoute(),
    LayoutCartDetail.goRoute(),
    LayoutCartSuccess.goRoute(),
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

        // Khang
        appBarTheme: const AppBarTheme(backgroundColor: appBarBackground, elevation: 0, iconTheme: IconThemeData(color: backButtonColor)),
        scaffoldBackgroundColor: scaffoldBackground,
      ),
      routerConfig: _router,
      builder: (context, child) => WaitingScreen(),
    );
  }
}
