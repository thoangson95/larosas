import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';
import 'modules/cart/layout_cart.dart';
import 'modules/cart/layout_cart_detail.dart';
import 'modules/cart/layout_cart_success.dart';
import 'modules/cart/model/cart_model.dart';
import 'modules/forgotpassword/layout_forgotpassword.dart';
import 'modules/login/layout_login.dart';
import 'modules/product_detail/layout_product_detail.dart';
import 'modules/redeemcode/layout_redeemcode.dart';
import 'modules/register/layout_register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(CartModelAdapter());
  await Hive.openBox<CartModel>('CartBox');
  await Hive.openBox<CartModel>('UserInfo');

  runApp(const ProviderScope(child: MyApp()));
}

final GoRouter _router = GoRouter(
  initialLocation: '/prodcut-detail',
  routes: <RouteBase>[
    LayoutCart.goRoute(),
    LayoutCartDetail.goRoute(),
    LayoutProductDetail.goRoute(),
    LayoutCartSuccess.goRoute(),
    LayoutLogin.goRoute(),
    LayoutRedeemCode.goRoute(),
    LayoutRegister.goRoute(),
    LayoutForgotPassword.goRoute(),
  ],
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
