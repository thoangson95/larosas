import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class RedemcodeScreen extends StatefulWidget {
  const RedemcodeScreen({super.key, required this.phonenumber});
  final String phonenumber;
  @override
  State<RedemcodeScreen> createState() => _RedemcodeScreenState();
}

class _RedemcodeScreenState extends State<RedemcodeScreen> {
  bool isresend = false;
  Color maincolor = const Color(0xFFFF7465);
  int countdown = 60;
  Widget numberRedeem(int order) {
    return Expanded(
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (order != 3) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).unfocus();
            }
          } else {
            if (order != 0) {
              FocusScope.of(context).previousFocus();
            }
          }
        },
        maxLength: 1,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(244, 244, 244, 1),
          contentPadding: EdgeInsets.only(top: 15.5, bottom: 15.5),
          counterText: "",
          isCollapsed: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        cursorColor: Colors.black,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        setState(
          () {
            Timer.periodic(
              const Duration(seconds: 1),
              (timer) {
                countdown--;
                if (mounted) {
                  super.setState(() {});
                }
                if (countdown <= 0) {
                  timer.cancel();
                  isresend = !isresend;
                }
              },
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

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
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              context.go("/");
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Text(
                "Quên mật khẩu",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 42),
                        child:
                            Text("Mã đã được gửi đến số ${widget.phonenumber}"),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          children: [
                            for (int i = 0; i < 4; i++) ...{
                              numberRedeem(i),
                              if (i < 3)
                                const SizedBox(
                                  width: 13,
                                )
                            }
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 26)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (isresend) ...{
                            TextButton(
                              onPressed: () {
                                isresend = !isresend;
                                countdown = 60;
                                setState(() {
                                  Timer.periodic(const Duration(seconds: 1),
                                      (timer) {
                                    countdown--;
                                    setState(() {});
                                    if (countdown <= 0) {
                                      timer.cancel();
                                      isresend = !isresend;
                                    }
                                  });
                                });
                              },
                              style: ButtonStyle(
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
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                overlayColor: MaterialStateColor.resolveWith(
                                  (states) {
                                    return Colors.transparent;
                                  },
                                ),
                              ),
                              child: Text(
                                "Gửi lại mã xác nhận",
                                style: TextStyle(
                                  color: maincolor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          } else ...{
                            const Text("Gửi lại mã sau "),
                            Text(
                              "${countdown}s",
                              style: TextStyle(color: maincolor),
                            ),
                          }
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 38)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 46,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: maincolor,
                                    alignment: Alignment.center),
                                onPressed: () {
                                  context.go("/");
                                },
                                child: const Text(
                                  "Xác nhận",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
