import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:larosas/modules/login/model/user_model.dart';

bool checkIsValidUsername(List<UserModel> users, String val) {
  bool boolean = true;
  for (int i = 0; i < users.length; i++) {
    if (users[i].username == val) boolean = false;
  }
  return boolean;
}

bool checkIsValidPhone(List<UserModel> users, int val) {
  bool boolean = true;
  for (int i = 0; i < users.length; i++) {
    if (users[i].phone == val) boolean = false;
  }
  return boolean;
}

bool checkIsValidEmail(List<UserModel> users, String val) {
  bool boolean = true;
  for (int i = 0; i < users.length; i++) {
    if (users[i].email == val) boolean = false;
  }
  return boolean;
}

Future<String> createUser(
  String username,
  int number,
  String email,
  String password,
  WidgetRef ref,
) async {
  final dio = Dio();
  final userlist =
      await dio.post("http://demo39.ninavietnam.com.vn/test1/user");
  if (userlist.statusCode == 200) {
    List jsonRaw = jsonDecode(userlist.data);
    List<UserModel> data = jsonRaw.map((e) => UserModel.fromJson(e)).toList();
    if (checkIsValidUsername(data, username) &&
        checkIsValidPhone(data, number) &&
        checkIsValidEmail(data, email)) {
      final response = await dio.post(
        "http://demo39.ninavietnam.com.vn/test1/register",
        data: {
          'username': username,
          'number': number,
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        if (response.data) {
          return "Đăng ký thành công";
        } else {
          return "Đăng ký thất bại";
        }
      } else {
        throw Exception("Lỗi kết nối tới server");
      }
    } else {
      return "Đăng ký thất bại";
    }
  } else {
    throw Exception("Lỗi kết nối tới server");
  }
}
