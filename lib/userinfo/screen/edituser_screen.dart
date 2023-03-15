import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../login/provider/login_state.dart';

class Camera extends ConsumerWidget {
  final ImagePicker imagePicker = ImagePicker();
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
            context.go('/userinfo');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Chỉnh sửa tài khoản",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async{
                  
                },
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: ref.watch(usersState)!.id!.isNotEmpty
                      ? NetworkImage(
                          'http://demo39.ninavietnam.com.vn/test1/thumbs/100x100x1/upload/user/${ref.watch(usersState)!.avatar}')
                      : const NetworkImage(
                          'http://demo39.ninavietnam.com.vn/test1/thumbs/390x334x1/upload/photo/loginpic-7250.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
