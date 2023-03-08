import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../cart/screen/cart_screen.dart';
import '../../constants.dart';
import '../../icons/AppFonts_icons.dart';
import '../../login/screen/login_screen.dart';
import 'widget/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeWidget(),
    const HomeWidget(),
    const CartScreen(),
    LoginScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomNavigationBar(
        selectedColor: colorMain,
        strokeColor: colorMain,
        unSelectedColor: const Color(0xffacacac),
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(AppFonts.home),
          ),
          CustomNavigationBarItem(
            icon: const Icon(AppFonts.heart),
          ),
          CustomNavigationBarItem(
            icon: const Icon(AppFonts.bag),
          ),
          CustomNavigationBarItem(
            icon: const Icon(AppFonts.user),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }
}
