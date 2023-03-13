import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../login/provider/login_state.dart';
import '../provider/register_controller.dart';
import '../provider/register_state.dart';
import 'widget/registerwidget.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final Color maincolor = const Color(0xFFFF7465);
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leading: Consumer(
            builder: (context, ref, child) {
              return IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  context.go('/login');
                  ref.read(invalidUsername.notifier).state = ref
                      .read(invalidNumber.notifier)
                      .state = ref.read(invalidEmail.notifier).state = ref
                          .read(isEmptyUsername.notifier)
                          .state =
                      ref.read(isEmptyPhone.notifier).state =
                          ref.read(isEmptyEmail.notifier).state =
                              ref.read(isEmptyPassword.notifier).state = false;
                  ref.read(acceptPolicyState.notifier).state = 0;
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              );
            },
          ),
          actions: [
            Consumer(
              builder: (context, ref, child) {
                return Container(
                  padding: const EdgeInsets.only(right: 12),
                  child: TextButton(
                    onPressed: () {
                      context.go('/login');
                      ref.read(invalidUsername.notifier).state = ref
                          .read(invalidNumber.notifier)
                          .state = ref.read(invalidEmail.notifier).state = ref
                              .read(isEmptyUsername.notifier)
                              .state =
                          ref.read(isEmptyPhone.notifier).state = ref
                                  .read(isEmptyEmail.notifier)
                                  .state =
                              ref.read(isEmptyPassword.notifier).state = false;
                      ref.read(acceptPolicyState.notifier).state = 0;
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith(
                        (states) {
                          return Colors.transparent;
                        },
                      ),
                    ),
                    child: const Text(
                      "Đăng nhập",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(164, 164, 164, 1),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 28),
              child: Text(
                "Đăng ký",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Consumer(
                    builder: (context, ref, child) {
                      int accepted = ref.watch(acceptPolicyState);
                      return Column(
                        children: [
                          Stack(
                            children: [
                              tf(
                                  Icons.person_outline,
                                  _username,
                                  "Username",
                                  false,
                                  false,
                                  isEmptyUsername,
                                  invalidUsername),
                              if (ref.watch(isEmptyUsername)) ...{
                                Positioned(
                                  bottom: 0,
                                  child: Text(
                                    "Chưa nhập username kìa bạn.",
                                    style: TextStyle(
                                        color: maincolor, fontSize: 13),
                                  ),
                                ),
                              } else if (ref.watch(invalidUsername)) ...{
                                Positioned(
                                  bottom: 0,
                                  child: Text(
                                    "Username đã tồn tại.",
                                    style: TextStyle(
                                        color: maincolor, fontSize: 13),
                                  ),
                                ),
                              }
                            ],
                          ),
                          Stack(
                            children: [
                              tf(Icons.call_outlined, _number, "Số điện thoại",
                                  true, false, isEmptyPhone, invalidNumber),
                              if (ref.watch(isEmptyPhone))
                                Positioned(
                                  bottom: 0,
                                  child: Text(
                                    "Chưa nhập số điện thoại kìa bạn.",
                                    style: TextStyle(
                                        color: maincolor, fontSize: 13),
                                  ),
                                )
                              else if (ref.watch(invalidNumber))
                                Positioned(
                                  bottom: 0,
                                  child: Text(
                                    "Số điện thoại đã tồn tại.",
                                    style: TextStyle(
                                        color: maincolor, fontSize: 13),
                                  ),
                                )
                            ],
                          ),
                          Stack(
                            children: [
                              tf(Icons.email_outlined, _email, "Email của bạn",
                                  false, false, isEmptyEmail, invalidEmail),
                              if (ref.watch(isEmptyEmail))
                                Positioned(
                                  bottom: 0,
                                  child: Text(
                                    "Chưa nhập email kìa bạn.",
                                    style: TextStyle(
                                        color: maincolor, fontSize: 13),
                                  ),
                                )
                              else if (ref.watch(invalidEmail))
                                Positioned(
                                  bottom: 0,
                                  child: Text(
                                    "Email đã tồn tại.",
                                    style: TextStyle(
                                        color: maincolor, fontSize: 13),
                                  ),
                                )
                            ],
                          ),
                          Stack(
                            children: [
                              tf(Icons.lock_open, _password, "Mật khẩu", false,
                                  true, isEmptyPassword, isEmptyPassword),
                              if (ref.watch(isEmptyPassword))
                                Positioned(
                                  bottom: 0,
                                  child: Text(
                                    "Chưa nhập mật khẩu kìa bạn.",
                                    style: TextStyle(
                                        color: maincolor, fontSize: 13),
                                  ),
                                )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: TextButton(
                              style: ButtonStyle(
                                  minimumSize:
                                      MaterialStateProperty.resolveWith(
                                    (states) {
                                      return Size.zero;
                                    },
                                  ),
                                  padding: MaterialStateProperty.resolveWith(
                                    (states) {
                                      return const EdgeInsets.all(0);
                                    },
                                  ),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    return Colors.transparent;
                                  })),
                              onPressed: () {
                                if (ref.watch(acceptPolicyState) == 0 ||
                                    ref.watch(acceptPolicyState) == 2) {
                                  ref.read(acceptPolicyState.notifier).state =
                                      1;
                                } else {
                                  ref.read(acceptPolicyState.notifier).state =
                                      0;
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    clipBehavior: Clip.hardEdge,
                                    width: 16,
                                    height: 16,
                                    margin: const EdgeInsets.only(right: 14),
                                    padding: const EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: maincolor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(150)),
                                    child: Icon(
                                      Icons.circle,
                                      size: 12,
                                      color: accepted == 1
                                          ? maincolor
                                          : Colors.transparent,
                                    ),
                                  ),
                                  Text(
                                    "Tôi đồng ý với điều khoản dịch vụ của La Rosa’s",
                                    style: TextStyle(
                                        color: maincolor, fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                          ),
                          if (ref.watch(acceptPolicyState) == 2)
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Bạn chưa chấp nhận điều khoản.",
                                style:
                                    TextStyle(color: maincolor, fontSize: 13),
                              ),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 46,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: maincolor),
                                    onPressed: () {
                                      ref.read(invalidUsername.notifier).state =
                                          false;
                                      ref.read(invalidNumber.notifier).state =
                                          false;
                                      ref.read(invalidEmail.notifier).state =
                                          false;
                                      if (_username.text.isEmpty) {
                                        ref
                                            .read(isEmptyUsername.notifier)
                                            .state = true;
                                      }
                                      if (_number.text.isEmpty) {
                                        ref.read(isEmptyPhone.notifier).state =
                                            true;
                                      }
                                      if (_email.text.isEmpty) {
                                        ref.read(isEmptyEmail.notifier).state =
                                            true;
                                      }
                                      if (_password.text.isEmpty) {
                                        ref
                                            .read(isEmptyPassword.notifier)
                                            .state = true;
                                      }
                                      if (accepted == 0) {
                                        ref
                                            .read(acceptPolicyState.notifier)
                                            .state = 2;
                                      }
                                      if (_username.text.isNotEmpty &&
                                          _number.text.isNotEmpty &&
                                          _email.text.isNotEmpty &&
                                          _password.text.isNotEmpty &&
                                          ref.read(acceptPolicyState) == 1) {
                                        ref
                                            .read(isEmptyUsername.notifier)
                                            .state = ref
                                                .read(isEmptyPhone.notifier)
                                                .state =
                                            ref
                                                    .read(isEmptyEmail.notifier)
                                                    .state =
                                                ref
                                                    .read(isEmptyPassword
                                                        .notifier)
                                                    .state = false;
                                        FocusScope.of(context).unfocus();
                                        ref.read(isLoading.notifier).state =
                                            true;
                                        Future.delayed(
                                          const Duration(seconds: 3),
                                          () {
                                            ref.read(isLoading.notifier).state =
                                                false;
                                            createUser(
                                              _username.text,
                                              _number.text,
                                              _email.text,
                                              _password.text,
                                              ref,
                                            ).then(
                                              (value) {
                                                ref
                                                    .read(statement.notifier)
                                                    .state = value;
                                                if (value == 1) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          "Đăng ký thành công"),
                                                    ),
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          "Đăng ký thất bại"),
                                                    ),
                                                  );
                                                }
                                              },
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: ref.watch(isLoading)
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : const Text(
                                            "Đăng ký",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextButton.icon(
                                  style: TextButton.styleFrom(
                                      foregroundColor: const Color(0xFF1877F2),
                                      backgroundColor: Colors.white,
                                      side: const BorderSide(
                                        width: 1,
                                        color: Color(0xFF1877F2),
                                      ),
                                      alignment: Alignment.center),
                                  onPressed: () {
                                    loginfb().then(
                                      (value) {
                                        if (value!.token.isNotEmpty) {
                                          userinfo().then((value1) {
                                            ref
                                                .read(
                                                    facebookuserState.notifier)
                                                .state = jsonEncode(value1);
                                            GoRouter.of(context).go('/home');
                                          });
                                        } else {}
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.facebook),
                                  label: const Text(
                                    "Tiếp tục với Facebook",
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
