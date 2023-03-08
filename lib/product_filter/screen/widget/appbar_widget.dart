import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      title: const Align(
        alignment: Alignment.center,
        child: Text(
          "Lọc sản phẩm",
          style: TextStyle(
            color: Color(0xFF222222),
            fontSize: 16,
            fontFamily: 'UAB',
          ),
        ),
      ),
      actions: const [
        SizedBox(
          width: 40,
        )
      ],
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }
}
