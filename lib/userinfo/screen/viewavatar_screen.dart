import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thoitrang/userinfo/provider/avatar_state.dart';

import '../../login/provider/login_state.dart';
import '../provider/avatar_controller.dart';

class ViewAvatar extends ConsumerWidget {
  const ViewAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ImagePicker imagePicker = ImagePicker();
    final File image = File(ref.watch(avatarProvider).path);
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
            ref.read(avatarProvider.notifier).state = XFile('');
            context.go('/camera');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Thay đổi ảnh",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ref.watch(avatarProvider).path == ''
              ? Image(
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'http://demo39.ninavietnam.com.vn/test1/thumbs/400x400x1/upload/user/${ref.watch(usersState).avatar}',
                  ),
                )
              : Image.file(
                  image,
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    ref.read(avatarProvider.notifier).state = (await imagePicker
                        .pickImage(source: ImageSource.gallery))!;
                  },
                  child: const Text('Chọn từ thư viện'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    ref.read(avatarProvider.notifier).state = (await imagePicker
                        .pickImage(source: ImageSource.camera))!;
                  },
                  child: const Text('Chụp từ camera'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white30),
                  padding: MaterialStateProperty.resolveWith(
                      (states) => const EdgeInsets.fromLTRB(40, 10, 40, 10)),
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.cyan),
                ),
                onPressed: () {
                  changeImage(image, ref.watch(usersState).id!, ref)
                      .then((value) {
                    if (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Thay đổi thành công')));
                      context.go('/userinfo');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Thay đổi thất bại')));
                      context.go('/camera');
                    }
                  });
                },
                child: const Text(
                  'Lưu',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
