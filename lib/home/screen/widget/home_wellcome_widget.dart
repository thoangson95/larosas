import 'package:flutter/material.dart';

class HomeWellcomeWidget extends StatelessWidget {
  const HomeWellcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
          child: const Text(
            'Xin Chào Dũng Royal.',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
          child: const Text(
            'Nhiều mẫu mã đang chờ bạn thị trường thời trang',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
