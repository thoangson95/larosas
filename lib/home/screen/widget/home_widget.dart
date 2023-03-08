import 'package:flutter/material.dart';
import 'body_widget.dart';
import 'header_widget.dart';
import 'search_widget.dart';
import 'title_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const HeaderWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  TitleWidget(),
                  SearchWidget(),
                  BodyWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
