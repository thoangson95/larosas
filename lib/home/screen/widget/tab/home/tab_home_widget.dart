import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'banner/home_banner_widget.dart';
import 'product/product_layout_widget.dart';

const List<String> imageList = [
  "https://images.template.net/108414/fashion-sale-banner-template-85svg.jpg",
  "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fashion-sale-banner-template-design-389dc7a74f096738d1d425314404a2cd_screen.jpg?ts=1605613724",
  "https://img.freepik.com/premium-vector/fashion-week-banner-template-promotion-fashion-banner_122059-223.jpg",
];

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
