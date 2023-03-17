import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:crypto/crypto.dart';

import '../model/user_model.dart';
import 'login_state.dart';

// Future<List<UserModel>> getUserList() async {
//   final response =
//       await http.post(Uri.parse("http://demo39.ninavietnam.com.vn/test1/user"));
//   if (response.statusCode == 200) {
//     List jsonRaw = jsonDecode(response.body);
//     List<UserModel> data = jsonRaw.map((e) => UserModel.fromJson(e)).toList();
//     return data;
//   } else {
//     throw Exception("Lỗi kết nối tới server");
//   }
// }

Future<List<UserModel>> getUserList() async {
  final dio = Dio();
  final response = await dio.post("http://demo39.ninavietnam.com.vn/test1/user");
  if (response.statusCode == 200) {
    List jsonRaw = jsonDecode(response.data);
    List<UserModel> data = jsonRaw.map((e) => UserModel.fromJson(e)).toList();
    return data;
  } else {
    throw Exception("Lỗi kết nối tới server");
  }
}

final fListUserProvider = FutureProvider<List<UserModel>>(
  (ref) async {
    return getUserList();
  },
);

bool checkLogin(
    List<UserModel> listUser, String email, String password, WidgetRef ref) {
  bool isTrue = false;

  if (email != '' && password != '') {
    for (int i = 0; i < listUser.length; i++) {
      if (listUser[i].email == email) {
        if (listUser[i].password ==
            md5.convert(utf8.encode(password)).toString()) {
          ref.read(usersState.notifier).state = listUser[i];
          isTrue = true;
        }
      }
    }
  }
  return isTrue;
}


// Future<UserModel> checkAccountAvailable(String email, String password) async {
//   final dio = Dio();
//   FormData formData = FormData.fromMap({'email': email, 'password': password});
//   final response = await dio.post("http://demo39.ninavietnam.com.vn/test1/user",
//       data: formData);
//   if (response.statusCode == 200) {
//     return UserModel.fromJson(jsonDecode(response.data));
//   } else {
//     throw Exception("Lỗi kết nối tới server");
//   }
// }

// Future<bool> checkLogin(String email, String password, WidgetRef ref) async {
//   if (email.isNotEmpty && password.isNotEmpty) {
//     await checkAccountAvailable(email, password).then((value) {
//       if (value.id != '') {
//         ref.read(usersState.notifier).state = value;
//         return true;
//       }
//     });
//   }
//   return false;
// }
