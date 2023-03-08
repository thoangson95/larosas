import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/account/forget/layout_forget.dart';
import 'package:thoitrang/home/layout_home.dart';
import '../../../register/layout_register.dart';
import '../../../../icons/AppFonts_icons.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () => context.push(LayoutRegister.pathRoute),
              child: const Text(
                'Đăng ký',
                style: TextStyle(
                    fontFamily: 'UA', fontSize: 14, color: Color(0xFFA4A4A4)),
              ),
            ),
          ),
        ],
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(
                          fontFamily: 'UA',
                          fontSize: 30,
                          color: Color(0xFF222222),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0xFFD9D9D9))),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: TextFormField(
                          obscureText: false,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Email của bạn',
                            hintStyle: const TextStyle(
                              fontFamily: 'UA',
                              color: Color(0xFF797979),
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 10, bottom: 10),
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Color(0xFFD9D9D9),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: const Icon(
                                  AppFonts.email,
                                  size: 22,
                                ),
                              ),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          style: const TextStyle(
                            fontFamily: 'UA',
                            color: Color(0xFF797979),
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0xFFD9D9D9))),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: TextFormField(
                          obscureText: obscureText,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              fontFamily: 'UA',
                              color: Color(0xFF797979),
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Color(0xFFD9D9D9),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: const Icon(
                                  AppFonts.unlock,
                                  size: 22,
                                ),
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: Icon(
                                obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            fontFamily: 'UA',
                            color: Color(0xFF797979),
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: TextButton(
                          onPressed: () => context.push(LayoutForget.pathRoute),
                          child: Text(
                            "Quên mật khẩu?",
                            style: TextStyle(
                              fontFamily: 'UA',
                              fontSize: 14,
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton(
                          onPressed: () => context.go(LayoutHome.pathRoute),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Đăng nhập',
                            style: TextStyle(
                              fontFamily: 'UAB',
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Image.asset(
                    'assets/images/hinh_dangnhap.png',
                    fit: BoxFit.cover,
                    height: 335,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
