import 'package:flutter/material.dart';

class BodyCategoriesWidget extends StatefulWidget {
  final int currentIndex;
  const BodyCategoriesWidget({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<BodyCategoriesWidget> createState() => _BodyCategoriesWidgetState();
}

class _BodyCategoriesWidgetState extends State<BodyCategoriesWidget> {
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
      visible: widget.currentIndex == 1,
      maintainState: true,
      // child: Column(
      //   children: categoriesLists
      //       .map((item) => CategoriesItem(item.id, item.name, item.image))
      //       .toList(),
      // ),
      child: Container(),
    );
  }
}
