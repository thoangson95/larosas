import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../icons/AppFonts_icons.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  bool obscureText = true;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        'Đăng ký',
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
                            hintText: 'Username',
                            hintStyle: const TextStyle(
                              fontFamily: 'UA',
                              color: Color(0xFF797979),
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
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
                                  AppFonts.user,
                                  size: 18,
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
                        padding: const EdgeInsets.only(top: 35),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Số điện thoại',
                            hintStyle: const TextStyle(
                              fontFamily: 'UA',
                              color: Color(0xFF797979),
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
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
                                  AppFonts.phone,
                                  size: 18,
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
                                  AppFonts.email,
                                  size: 18,
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
                      padding: const EdgeInsets.only(top: 30),
                      margin: const EdgeInsets.only(bottom: 35),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0xFFD9D9D9))),
                      ),
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
                                size: 18,
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
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                            checkColor: Colors
                                .white, // Màu của checkmark bên trong checkbox
                            activeColor: Theme.of(context)
                                .primaryColor, // Màu của checkbox khi đã được chọn
                            shape:
                                const CircleBorder(), // Đặt shape cho checkbox là CircleBorder để tạo border tròn
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1,
                            ),
                            visualDensity: VisualDensity
                                .compact, // Giúp checkbox có kích thước nhỏ hơn
                            materialTapTargetSize: MaterialTapTargetSize
                                .shrinkWrap, // Để checkbox có thể nhấp ở bất kỳ vị trí nào, không chỉ ở chính giữa
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Tôi đồng ý với điều khoản dịch vụ của La Rosa’s ',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'UA',
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton(
                          onPressed: () => context.go('/home'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Đăng ký',
                            style: TextStyle(
                              fontFamily: 'UAB',
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 25),
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: const BorderSide(
                            color: Color(0xFF1877F2),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              AppFonts.fb,
                              color: Color(0xFF1877F2),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                'Tiếp tục với Facebook',
                                style: TextStyle(
                                  fontFamily: 'UA',
                                  fontSize: 13,
                                  color: Color(0xFF1877F2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
