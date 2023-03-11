import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../provider/login_controller.dart';
import '../provider/login_state.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color maincolor = const Color(0xFFFF7465);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          actions: [
            Consumer(
              builder: (context, ref, child) {
                return TextButton(
                  onPressed: () {
                    context.go('/register');
                    ref.read(isLEmptyEmail.notifier).state = false;
                    ref.read(isLEmptyPassword.notifier).state = false;
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith(
                      (states) {
                        return Colors.transparent;
                      },
                    ),
                  ),
                  child: const Text(
                    "Đăng ký",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(164, 164, 164, 1),
                    ),
                  ),
                );
              },
            )
          ],
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Đăng Nhập",
                      style: TextStyle(fontSize: 30),
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        return Stack(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 40, bottom: 20),
                              padding: const EdgeInsets.only(bottom: 8, top: 8),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromRGBO(217, 217, 217, 1),
                                        ),
                                      ),
                                    ),
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10),
                                    margin: const EdgeInsets.only(right: 10),
                                    child: const Icon(Icons.email_outlined),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          ref
                                              .read(isLEmptyEmail.notifier)
                                              .state = false;
                                        } else {
                                          ref
                                              .read(isLEmptyEmail.notifier)
                                              .state = true;
                                        }
                                      },
                                      controller: _email,
                                      cursorColor: Colors.black,
                                      decoration:
                                          const InputDecoration.collapsed(
                                        hintText: "Email của bạn",
                                        hintStyle: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            if (ref.watch(isLEmptyEmail))
                              Positioned(
                                bottom: 0,
                                child: Text(
                                  'Chưa nhập Email kìa bạn',
                                  style:
                                      TextStyle(color: maincolor, fontSize: 12),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        final visible = ref.watch(isShowPasswordState);
                        return Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 0, bottom: 20),
                              padding: const EdgeInsets.only(bottom: 8, top: 8),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          width: 1,
                                          color: Color(0xFFD9D9D9),
                                        ),
                                      ),
                                    ),
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10),
                                    margin: const EdgeInsets.only(right: 10),
                                    child: const Icon(Icons.lock_open_outlined),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      onTap: () {
                                        _password.clear();
                                      },
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          ref
                                              .read(isLEmptyPassword.notifier)
                                              .state = false;
                                        } else {
                                          ref
                                              .read(isLEmptyPassword.notifier)
                                              .state = true;
                                        }
                                      },
                                      controller: _password,
                                      obscureText: !visible,
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                        isCollapsed: true,
                                        border: InputBorder.none,
                                        hintText: "Mật khẩu",
                                        hintStyle: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(),
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    child: TextButton(
                                      onPressed: () {
                                        ref
                                                .read(isShowPasswordState.notifier)
                                                .state =
                                            !ref.watch(isShowPasswordState);
                                      },
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          return Colors.black;
                                        }),
                                        padding:
                                            MaterialStateProperty.resolveWith(
                                          (states) {
                                            return const EdgeInsets.all(0);
                                          },
                                        ),
                                        minimumSize:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          return Size.zero;
                                        }),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        overlayColor:
                                            MaterialStateProperty.resolveWith(
                                          (states) {
                                            return Colors.transparent;
                                          },
                                        ),
                                      ),
                                      child: Icon(
                                        ref.watch(isShowPasswordState)
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            if (ref.watch(isLEmptyPassword))
                              Positioned(
                                bottom: 0,
                                child: Text(
                                  "Chưa nhập password kìa bạn",
                                  style: TextStyle(
                                    color: maincolor,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                context.go('/forgotpassword');
                                ref.read(isLEmptyEmail.notifier).state = false;
                                ref.read(isLEmptyPassword.notifier).state =
                                    false;
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    return maincolor;
                                  },
                                ),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding: MaterialStateProperty.resolveWith(
                                  (states) {
                                    return const EdgeInsets.all(0);
                                  },
                                ),
                                minimumSize: MaterialStateProperty.resolveWith(
                                  (states) {
                                    return Size.zero;
                                  },
                                ),
                                overlayColor: MaterialStateProperty.resolveWith(
                                  (states) {
                                    return Colors.transparent;
                                  },
                                ),
                              ),
                              child: const Text(
                                "Quên mật khẩu ?",
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 46,
                            child: Consumer(
                              builder: (context, ref, child) {
                                final isload = ref.watch(loading);
                                final listUser = ref.watch(fListUserProvider);
                                final isLogin = ref.watch(loginState);
                                return TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: maincolor),
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    if (_email.text == '') {
                                      ref.read(isLEmptyEmail.notifier).state =
                                          true;
                                    }
                                    if (_password.text == '') {
                                      ref.read(isLEmptyPassword.notifier).state =
                                          true;
                                    }
                                    if (_email.text.isNotEmpty &&
                                        _password.text.isNotEmpty) {
                                      if (isLogin == false) {
                                        listUser.when(
                                          data: (data) {
                                            ref
                                                    .read(loginState.notifier)
                                                    .state =
                                                checkLogin(data, _email.text,
                                                    _password.text, ref);
                                            ref.read(loading.notifier).state =
                                                true;
                                            if (ref.watch(loginState)) {
                                              Future.delayed(
                                                const Duration(seconds: 2),
                                                () {
                                                  ref
                                                      .read(loading.notifier)
                                                      .state = false;
                                                  _email.clear();
                                                  _password.clear();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'Đăng nhập thành công'),
                                                    ),
                                                  );
                                                  context.go("/home");
                                                },
                                              );
                                            } else {
                                              Future.delayed(
                                                const Duration(seconds: 2),
                                                () {
                                                  ref
                                                      .read(loading.notifier)
                                                      .state = false;
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'Đăng nhập thất bại'),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          error: (error, stackTrace) {},
                                          loading: () {},
                                        );
                                      }
                                    }
                                  },
                                  child: isload
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : const Text(
                                          "Đăng nhập",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Image.network(
                "http://demo39.ninavietnam.com.vn/test1/thumbs/390x334x1/upload/photo/loginpic-7250.png",
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
