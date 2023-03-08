import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../forget_code/layout_forget_code.dart';
import '../../../../../icons/AppFonts_icons.dart';
import '../../provider/user_provider.dart';
import '../../extension/extension_formz.dart';

class ForgetWidget extends ConsumerWidget {
  const ForgetWidget({super.key});

  @override
  Widget build(context, ref) {
    var maskFormatter = MaskTextInputFormatter(
        mask: '### ### ####', filter: {"#": RegExp(r'[0-9]')});
    final formKey = GlobalKey<FormState>();

    return ProviderScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
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
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "Nhập số điện thoại của bạn",
                      style: TextStyle(
                        fontFamily: 'UA',
                        fontSize: 15,
                        color: Color(0xFF222222),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Color(0xFFD9D9D9))),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 75),
                      child: Form(
                        key: formKey,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          textAlignVertical: TextAlignVertical.center,
                          inputFormatters: [maskFormatter],
                          onSaved: (value) {
                            ref.read(forgetProviders.notifier).onClickForget(
                                  value.toString(),
                                );
                            final phoneState = ref.watch(forgetProviders);
                            if (phoneState.status == FormzStatus.invalid) {
                              AlertController.show(
                                  "Thông báo",
                                  phoneState.phone?.error?.getError(context) ??
                                      'lỗi',
                                  TypeAlert.error);
                            } else {
                              context.push(LayoutForgetCode.pathRoute);
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Mobile Number',
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
                                  AppFonts.phone,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 65),
                    child: SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState?.save();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Gửi code",
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
      ),
    );
  }
}
