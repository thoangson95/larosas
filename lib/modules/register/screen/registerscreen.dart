import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 12),
              child: TextButton(
                onPressed: () {},
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
            ),
          ],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                child: Column(
                  children: [
                    tf(Icons.person_outline, _username, "Username", false,
                        false),
                    tf(Icons.call_outlined, _number, "Số điện thoại", true,
                        false),
                    tf(Icons.email_outlined, _email, "Email của bạn", false,
                        false),
                    tf(Icons.lock_open, _password, "Mật khẩu", false, true),
                    Consumer(
                      builder: (context, ref, child) {
                        bool accepted = ref.watch(acceptPolicyState);
                        return Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextButton(
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.resolveWith(
                                  (states) {
                                    return Size.zero;
                                  },
                                ),
                                padding: MaterialStateProperty.resolveWith(
                                  (states) {
                                    return const EdgeInsets.all(0);
                                  },
                                ),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                overlayColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return Colors.transparent;
                                })),
                            onPressed: () {
                              ref.read(acceptPolicyState.notifier).state =
                                  !accepted;
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
                                      borderRadius: BorderRadius.circular(150)),
                                  child: Icon(
                                    Icons.circle,
                                    size: 12,
                                    color: accepted
                                        ? maincolor
                                        : Colors.transparent,
                                  ),
                                ),
                                Text(
                                  "Tôi đồng ý với điều khoản dịch vụ của La Rosa’s",
                                  style:
                                      TextStyle(color: maincolor, fontSize: 13),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            final str = ref.watch(statemnet);
                            final issuccess = ref.watch(isCreateSuccess);
                            return Text(str);
                          },
                        ),
                        Consumer(
                          builder: (context, ref, child) {
                            return Expanded(
                              child: SizedBox(
                                height: 46,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: maincolor),
                                  onPressed: () {
                                    createUser(
                                      _username.text,
                                      int.parse(_number.text),
                                      _email.text,
                                      _password.text,
                                      ref,
                                    ).then((value) => ref
                                        .read(statemnet.notifier)
                                        .state = value);
                                  },
                                  child: const Text(
                                    "Đăng ký",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          },
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
                            onPressed: () {},
                            icon: const Icon(Icons.facebook),
                            label: const Text(
                              "Tiếp tục với Facebook",
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
