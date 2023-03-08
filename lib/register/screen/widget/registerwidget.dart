import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/register_state.dart';

Widget tf(
  IconData icons,
  TextEditingController controller,
  String lable,
  bool isnumber,
  bool ispassword,
  StateProvider state,
  StateProvider state2 
) {
  return Consumer(
    builder: (context, ref, child) {
      bool visible = ref.watch(showPasswordState);
      return Container(
        margin: const EdgeInsets.only(top: 8, bottom: 18),
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
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
              padding: const EdgeInsets.only(right: 10, left: 10),
              margin: const EdgeInsets.only(right: 10),
              child: Icon(icons),
            ),
            if (ispassword) ...{
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      ref.read(state.notifier).state = false;
                      ref.read(state2.notifier).state = false;
                    } else {
                      ref.read(state.notifier).state = true;
                    }
                  },
                  controller: controller,
                  cursorColor: Colors.black,
                  obscureText: !visible,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    border: InputBorder.none,
                    hintText: lable,
                    hintStyle: const TextStyle(fontSize: 13),
                  ),
                ),
              ),
            } else if (isnumber) ...{
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      ref.read(state.notifier).state = false;
                      ref.read(state2.notifier).state = false;
                    } else {
                      ref.read(state.notifier).state = true;
                    }
                  },
                  controller: controller,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  maxLength: 10,

                  decoration: InputDecoration(
                    isCollapsed: true,
                    border: InputBorder.none,
                    counterText: "",
                    hintText: lable,
                    hintStyle: const TextStyle(fontSize: 13),
                  ),
                ),
              ),
            } else
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      ref.read(state.notifier).state = false;
                      ref.read(state2.notifier).state = false;
                    } else {
                      ref.read(state.notifier).state = true;
                    }
                  },
                  controller: controller,
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                    hintText: lable,
                    hintStyle: const TextStyle(fontSize: 13),
                  ),
                ),
              ),
            if (ispassword)
              Container(
                decoration: const BoxDecoration(),
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: TextButton(
                  onPressed: () {
                    ref.read(showPasswordState.notifier).state = !visible;
                  },
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        return Colors.black;
                      }),
                      padding: MaterialStateProperty.resolveWith(
                        (states) {
                          return const EdgeInsets.all(0);
                        },
                      ),
                      minimumSize: MaterialStateProperty.resolveWith((states) {
                        return Size.zero;
                      }),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      overlayColor: MaterialStateProperty.resolveWith((states) {
                        return Colors.transparent;
                      })),
                  child: Icon(
                    visible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
              ),
          ],
        ),
      );
    },
  );
}
