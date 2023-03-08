
import 'package:flutter/material.dart';

import '../provider/formz.dart';

extension ExtPhoneInput on PhoneError {
  String? getError(BuildContext context) {
    switch (this) {
      case PhoneError.empty:
        return "Vui lòng nhập số điện thoại";
      case PhoneError.validator:
        return "Vui lòng nhập đúng số điện thoại";
      default:
        return null;
    }
  }
}
