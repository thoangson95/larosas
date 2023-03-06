import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';

final usersState = StateProvider<UserModel?>((ref) => null);

final loginState = StateProvider<bool>((ref) => false);

final loading = StateProvider<bool>((ref) => false);

final isShowPasswordState = StateProvider((ref) => false);