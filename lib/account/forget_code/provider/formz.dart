import 'package:formz/formz.dart';

enum PhoneError { empty, validator }

class CheckPhone extends FormzInput<String, PhoneError> {
  const CheckPhone.pure() : super.pure('');
  const CheckPhone.dirty([String value = '']) : super.dirty(value);

  @override
  PhoneError? validator(String value) {
    if (value.isEmpty) {
      return PhoneError.empty;
    } else if (!RegExp(r'^\d{3}\ \d{3}\ \d{4}$').hasMatch(value)) {
      return PhoneError.validator;
    }
    return null;
  }
}
