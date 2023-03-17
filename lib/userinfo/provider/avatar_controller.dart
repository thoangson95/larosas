import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:path/path.dart';

import '../../login/model/user_model.dart';
import '../../login/provider/login_state.dart';

const String path = 'http://demo39.ninavietnam.com.vn/test1';

Future<bool> changeImage(File image, String id, WidgetRef ref) async {
  final dio = Dio();
  bool isDone = false;
  if (id.isNotEmpty) {
    if (image.path != '') {
      FormData formData = FormData.fromMap(
        {
          "id": id,
          "file": await MultipartFile.fromFile(image.path,
              filename: basename(image.path)),
        },
      );
      FormData user = FormData.fromMap({'id': id});

      final response = await dio.post(
        "$path/editavatar",
        data: formData,
      );
      if (response.data == '1') {
        final response2 = await dio.post('$path/userrefesh', data: user);
        if (response2.statusCode == 200) {
          if (response2.data != false) {
            ref.watch(usersState.notifier).state =
                UserModel.fromJson(jsonDecode(response2.data));
            isDone = true;
          }
        }
      }
    }
  }
  return isDone;
}

// Future<bool> refreshAccount(WidgetRef ref, String id) async {
//   bool isRefeshed = false;
//   final Dio dio = Dio();
//   if (id.isNotEmpty) {
//     final response = await dio.post('$path/userrefesh', data: formdata);
//     if (response.statusCode == 200) {
//       if (response.data != false) {
//         ref.read(usersState.notifier).state =
//             UserModel.fromJson(jsonDecode(response.data));
//         isRefeshed = true;
//       }
//     }
//   }
//   return isRefeshed;
// }
