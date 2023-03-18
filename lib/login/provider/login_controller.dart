import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


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

const String Href = 'http://demo39.ninavietnam.com.vn/test1';


Future<bool> loginUser(String email, String password, WidgetRef ref) async {
  bool success = false;
  final dio = Dio();
  FormData formData = FormData.fromMap({'email': email, 'password': password});
  final response = await dio.post('$Href/login', data: formData);
  if (response.statusCode == 200) {
    if (response.data != false) {
      ref.read(usersState.notifier).state =
          UserModel.fromJson(jsonDecode(response.data));
      success = true;
    }
  }
  return success;
}
