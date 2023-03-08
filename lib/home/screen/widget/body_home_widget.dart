import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../product_all/layout_product_all.dart';
import 'product_widget.dart';

class BodyHomeWidget extends StatefulWidget {
  final int currentIndex;
  const BodyHomeWidget({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<BodyHomeWidget> createState() => _BodyHomeWidgetState();
}

class _BodyHomeWidgetState extends State<BodyHomeWidget> {
  final List<String> imageList = [
    "assets/images/slide.png",
  ];

  List<Widget> generateImages() {
    return imageList
        .map(
          (e) => ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              e,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.currentIndex == 0,
      maintainState: true,
      child: Column(
        children: [
          CarouselSlider(
            items: generateImages(),
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
              viewportFraction: 1,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Hàng mới về',
                  style: TextStyle(
                    fontFamily: 'UAB',
                    fontSize: 14,
                    color: Color(0xFF222222),
                  ),
                ),
                TextButton(
                  onPressed: () => context.go(LayoutProductAll.pathRoute),
                  child: Text('Tất cả',
                      style: TextStyle(
                        fontFamily: 'UA',
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                      )),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ProductWidget('/product?p=1&perPage=6'),
          ),
        ],
      ),
    );
  }
}
