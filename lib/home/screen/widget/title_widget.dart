import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: const Text(
            'Xin Chào Bảo Ngọc',
            style: TextStyle(
              fontFamily: 'UAB',
              fontSize: 13,
              color: Color(0xff222222),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: const Text(
            'Nhiều mẫu mã đang chờ bạn thị trường thời trang',
            style: TextStyle(
              fontFamily: 'UA',
              fontSize: 12,
              color: Color(0xff5B5B5B),
            ),
          ),
        ),
      ],
    );
  }
}
