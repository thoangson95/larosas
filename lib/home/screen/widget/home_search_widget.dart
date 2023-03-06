import 'package:flutter/material.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
      child: Column(
        children: [
          SizedBox(
            height: 45,
            child: TextField(
              cursorColor: Colors.grey,
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 13.0,
                height: 1,
              ),
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                fillColor: const Color.fromRGBO(242, 242, 242, 1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: BorderSide.none,
                ),
                hintText: ' Tìm kiếm sản phẩm',
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(106, 106, 106, 1),
                  fontSize: 12.0,
                  height: 1,
                ),
                suffixIcon: Container(
                  padding: const EdgeInsets.all(14),
                  margin: const EdgeInsets.only(right: 0),
                  child: Image.asset(
                    'assets/images/icons/search.png',
                    width: 16,
                    height: 16,
                  ),
                ),
              ),
              onSubmitted: (value) {
                // ignore: avoid_print
                print(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
