import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';
import 'register_state.dart';

bool checkIsValidUsername(List<UserModel> users, String val, WidgetRef ref) {
  bool boolean = true;
  for (int i = 0; i < users.length; i++) {
    if (users[i].username!.contains(val)) {
      boolean = false;
      ref.read(invalidUsername.notifier).state = true;
    }
  }
  return boolean;
}

bool checkIsValidPhone(List<UserModel> users, String val, WidgetRef ref) {
  bool boolean = true;
  for (int i = 0; i < users.length; i++) {
    if (users[i].phone!.contains(val)) {
      boolean = false;
      ref.read(invalidNumber.notifier).state = true;
    }
  }
  return boolean;
}

bool checkIsValidEmail(List<UserModel> users, String val, WidgetRef ref) {
  bool boolean = true;
  for (int i = 0; i < users.length; i++) {
    if (users[i].email!.contains(val)) {
      boolean = false;
      ref.read(invalidEmail.notifier).state = true;
    }
  }
  return boolean;
}

Future<int> createUser(
  String username,
  String number,
  String email,
  String password,
  WidgetRef ref,
) async {
  final dio = Dio();
  final userlist = await dio.post("http://10.0.2.2:80/test/user");
  if (userlist.statusCode == 200) {
    List jsonRaw = jsonDecode(userlist.data);
    List<UserModel> data = jsonRaw.map((e) => UserModel.fromJson(e)).toList();
    if (checkIsValidUsername(data, username, ref) &&
        checkIsValidPhone(data, number, ref) &&
        checkIsValidEmail(data, email, ref)) {
      var formData = FormData.fromMap({
        'username': username,
        'phone': number,
        'email': email,
        'password': password,
      });
      final response = await dio.post(
        "http://10.0.2.2:80/test/register",
        data: formData,
      );
      if (response.statusCode == 200) {
        if (response.data.toString().isNotEmpty) {
          return 1;
        } else {
          return 2;
        }
      } else {
        throw Exception("Lỗi kết nối tới server");
      }
    } else {
      return 0;
    }
  } else {
    throw Exception("Lỗi kết nối tới server");
  }
}
