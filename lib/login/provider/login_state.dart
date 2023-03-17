import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';

final usersState = StateProvider<UserModel>((ref) {
  return UserModel(
    id: "0",
    idSocial: '0',
    username: '0',
    password: '0',
    confirmCode: '0',
    avatar: '0',
    fullname: '0',
    phone: '0',
    email: '0',
    address: '0',
    gender: '0',
    loginSession: '0',
    lastlogin: '0',
    status: '0',
    birthday: '0',
    numb: '0',
  );
});

final loginState = StateProvider<bool>((ref) => false);

final loading = StateProvider<bool>((ref) => false);

final isShowPasswordState = StateProvider((ref) => false);

final isLEmptyEmail = StateProvider((ref) => false);

final isLEmptyPassword = StateProvider((ref) => false);

final facebookuserState = StateProvider((ref) => "");
