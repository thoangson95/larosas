import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../login/provider/login_state.dart';

class UserInfoScreen extends ConsumerWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        shape: const BorderDirectional(
          bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(241, 241, 241, 1),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Tài khoản",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(236, 236, 236, 1),
                    ),
                  ),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black),
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStateProperty.resolveWith(
                      (states) => Size.zero,
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircleAvatar(
                            backgroundImage: ref
                                    .watch(facebookuserState)
                                    .isNotEmpty
                                ? NetworkImage(jsonDecode(
                                        ref.watch(facebookuserState))['picture']
                                    ['data']['url'])
                                : const NetworkImage(
                                    'http://demo39.ninavietnam.com.vn/test1/thumbs/390x334x1/upload/photo/loginpic-7250.png')),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 14),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ref.watch(facebookuserState).isNotEmpty
                                  ? jsonDecode(
                                      ref.watch(facebookuserState))['name']
                                  : '',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Chỉnh sửa',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(128, 128, 128, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(236, 236, 236, 1),
                    ),
                  ),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black),
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStateProperty.resolveWith(
                      (states) => Size.zero,
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text("Giỏ hàng", style: TextStyle(fontSize: 13)),
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(236, 236, 236, 1),
                    ),
                  ),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black),
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStateProperty.resolveWith(
                      (states) => Size.zero,
                    ),
                  ),
                  onPressed: () {
                    context.go('/home');
                  },
                  child: Row(
                    children: const [
                      Expanded(
                          child:
                              Text('Đơn hàng', style: TextStyle(fontSize: 13))),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(236, 236, 236, 1),
                    ),
                  ),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black),
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStateProperty.resolveWith(
                      (states) => Size.zero,
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text("Phiếu giảm giá & Mã khuyến mại",
                            style: TextStyle(fontSize: 13)),
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 27, bottom: 27),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(236, 236, 236, 1),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 47,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xffFE5A6B), Color(0xffFF6693)],
                          ),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            alignment: Alignment.centerLeft,
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => Colors.white30),
                            padding: MaterialStateProperty.resolveWith(
                                (states) =>
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0)),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "10%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Khi mua đơn hàng 200k",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Container(
                        height: 47,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xffFE5A6B), Color(0xffFF6693)],
                          ),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            alignment: Alignment.centerLeft,
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => Colors.white30),
                            padding: MaterialStateProperty.resolveWith(
                                (states) =>
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0)),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "20%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Khi mua đơn hàng 500k",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(236, 236, 236, 1),
                    ),
                  ),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black),
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStateProperty.resolveWith(
                      (states) => Size.zero,
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text("Địa chỉ giao hàng",
                            style: TextStyle(fontSize: 13)),
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(236, 236, 236, 1),
                    ),
                  ),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black),
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStateProperty.resolveWith(
                      (states) => Size.zero,
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text("Hỏi đáp", style: TextStyle(fontSize: 13)),
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(236, 236, 236, 1),
                    ),
                  ),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black),
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStateProperty.resolveWith(
                      (states) => Size.zero,
                    ),
                  ),
                  onPressed: () async {
                    if (ref.watch(facebookuserState).isNotEmpty) {
                      await FacebookAuth.instance
                          .logOut()
                          .then((value) => context.go('/login'));
                      ref.read(facebookuserState.notifier).state = "";
                    } else {
                      context.go('/login');
                      ref.read(loginState.notifier).state = false;
                    }
                  },
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          "Đăng xuất",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
