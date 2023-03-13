import 'package:flutter_riverpod/flutter_riverpod.dart';

final showPasswordState = StateProvider((ref) => false);

final acceptPolicyState = StateProvider((ref) => 0);

final isCreateSuccess = StateProvider((ref) => false);

final statement = StateProvider<int?>((ref) => null);

final invalidUsername = StateProvider((ref) => false);

final invalidNumber = StateProvider((ref) => false);

final invalidEmail = StateProvider((ref) => false);

final isEmptyUsername = StateProvider((ref) => false);

final isEmptyPhone = StateProvider((ref) => false);

final isEmptyEmail = StateProvider((ref) => false);

final isEmptyPassword = StateProvider((ref) => false);

final isLoading = StateProvider((ref) => false);
