import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../home/layout_home.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      leading: BackButton(
        onPressed: () => context.go(LayoutHome.pathRoute),
      ),
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }
}
