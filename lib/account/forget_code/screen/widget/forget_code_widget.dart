import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../forget/provider/user_provider.dart';

class ForgetCodeWidget extends ConsumerStatefulWidget {
  const ForgetCodeWidget({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgetCodeWidgetState();
}

class _ForgetCodeWidgetState extends ConsumerState<ForgetCodeWidget> {
  int secondsRemaining = 60;
  bool timerFinished = false;

  Timer? _timerCounter;

  void _startTimer() {
    _timerCounter = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
        } else {
          timer.cancel();
          timerFinished = true;
        }
      });
    });
  }

  void _restartTimer() {
    setState(() {
      secondsRemaining = 60;
      timerFinished = false;
    });
    _startTimer();
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timerCounter?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final phoneState = ref.watch(forgetProviders);
    String phoneNumber = phoneState.phone!.value;
    String maskedPhoneNumber = '******${phoneNumber.replaceRange(0, 9, '***')}';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => context.go('/forget'),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Quên mật khẩu',
                    style: TextStyle(
                      fontFamily: 'UA',
                      fontSize: 30,
                      color: Color(0xFF222222),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Mã đã được gửi đến số $maskedPhoneNumber',
                    style: const TextStyle(
                      fontFamily: 'UA',
                      fontSize: 15,
                      color: Color(0xFF222222),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 50, 15, 5),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    obscureText: true,
                    obscuringCharacter: '*',
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 60,
                      fieldWidth: 70,
                      activeFillColor: Colors.white,
                      inactiveFillColor: const Color(0xFFF4F4F4),
                      errorBorderColor: const Color(0xFFF4F4F4),
                      inactiveColor: const Color(0xFFF4F4F4),
                      borderWidth: 1,
                      selectedFillColor: Theme.of(context).primaryColor,
                      fieldOuterPadding: EdgeInsets.zero,
                      selectedColor: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onCompleted: (v) {},
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                  ),
                ),
                timerFinished
                    ? ElevatedButton(
                        onPressed: _restartTimer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ),
                        child: Text(
                          'Gửi lại',
                          style: TextStyle(
                            fontFamily: 'UA',
                            fontSize: 15,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    : RichText(
                        text: TextSpan(
                          text: 'Gửi lại mã sau ',
                          style: const TextStyle(
                            fontFamily: 'UA',
                            fontSize: 15,
                            color: Color(0xFF222222),
                          ),
                          children: [
                            TextSpan(
                              text: '${secondsRemaining}s',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(top: 65),
                  child: SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Xác nhận',
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
          ],
        ),
      ),
    );
  }
}
