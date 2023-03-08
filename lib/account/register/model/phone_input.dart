import 'package:formz/formz.dart';

enum PhoneInputError { empty, invalid }

class PhoneInput extends FormzInput<String, PhoneInputError> {
  const PhoneInput.pure() : super.pure('');
  const PhoneInput.dirty([super.value = '']) : super.dirty();

  bool validatePhone(String phone) {
    return RegExp(r'''([\+84|84|0]+(3|5|7|8|9|1[2|6|8|9]))+([0-9]{8})$''')
        .hasMatch(phone);
  }

  @override
  PhoneInputError? validator(String value) {
    if (value.isEmpty) {
      return PhoneInputError.empty;
    }
    if (!validatePhone(value)) {
      return PhoneInputError.invalid;
    }
    return null;
  }
}
