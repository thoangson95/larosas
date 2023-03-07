import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'banner/home_banner_widget.dart';
import 'product/product_layout_widget.dart';

class TabHomeWidget extends StatelessWidget {
  const TabHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const HomeBannerWidget(),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Row(
          children: <Widget>[
            const Flexible(
              fit: FlexFit.tight,
              child: Text(
                'Hàng mới về',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color.fromRGBO(34, 34, 34, 1),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: InkWell(
                onTap: () => context.go('/products'),
                child: const Text(
                  'Tất cả',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(255, 116, 101, 1),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        child: const ProductLayerWidget(),
      ),
    ]);
  }
}
