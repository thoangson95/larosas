import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../login/provider/login_state.dart';

// ignore: must_be_immutable
class Camera extends ConsumerWidget {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? image;
  Camera({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        shape: const BorderDirectional(
          bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(241, 241, 241, 1),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            context.go('/home');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Thông tin tài khoản",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.transparent),
                  onTap: () {
                    context.go('/viewavatar');
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: Colors.cyan,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          child: ref.watch(usersState).id!.isNotEmpty
                              ? Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'http://demo39.ninavietnam.com.vn/test1/thumbs/400x400x1/upload/user/${ref.watch(usersState).avatar}'))
                              : const Image(
                                  image: NetworkImage(
                                      'http://demo39.ninavietnam.com.vn/test1/thumbs/390x334x1/upload/photo/loginpic-7250.png')),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  color: Colors.black45,
                                  child: const Text(
                                    'Chỉnh sửa',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Họ và tên',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    ref.watch(usersState).fullname.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Giới tính'),
                  Text(ref.watch(usersState).gender == '1' ? 'Nam' : 'Nữ')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Ngày sinh'),
                  Text(
                    DateFormat('dd/MM/yyyy').format(
                      DateTime.fromMillisecondsSinceEpoch(
                        int.parse(ref.watch(usersState).birthday.toString()) *
                            1000,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Số điện thoại'),
                  Text(ref.watch(usersState).phone.toString()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Email'),
                  Text(ref.watch(usersState).email.toString()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Địa chỉ'),
                  Text(ref.watch(usersState).address.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
