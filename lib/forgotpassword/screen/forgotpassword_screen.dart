import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class FogotpasswordScreen extends StatefulWidget {
  const FogotpasswordScreen({super.key});

  @override
  State<FogotpasswordScreen> createState() => _FogotpasswordScreenState();
}

class _FogotpasswordScreenState extends State<FogotpasswordScreen> {
  Color maincolor = const Color(0xFFFF7465);

  late TextEditingController _phonenumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phonenumber = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phonenumber.dispose();
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
                        padding: const EdgeInsets.only(top: 30, bottom: 38),
                        child: const Text("Nhập số điện thoại của bạn"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        padding: const EdgeInsets.only(bottom: 10, top: 10),
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
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                  ),
                                ),
                              ),
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              margin: const EdgeInsets.only(right: 10),
                              child: const Icon(Icons.call_outlined),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _phonenumber,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                style: const TextStyle(
                                    color: Color.fromRGBO(121, 121, 121, 1),
                                    fontSize: 13),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  isCollapsed: true,
                                  border: InputBorder.none,
                                  counterText: "",
                                  hintText: "Nhập số điện thoại của bạn",
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromRGBO(121, 121, 121, 1)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 26)),
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
                                  if (_phonenumber.text != '') {
                                    context.goNamed(
                                      "redeemcode",
                                      params: {"number": _phonenumber.text},
                                    );
                                  }
                                },
                                child: const Text(
                                  "Gửi code",
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
