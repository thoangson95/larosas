import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitrang/constants.dart';

import 'widget/appbar_widget.dart';
import 'widget/button_widget.dart';
import 'widget/filter_ranger_widget.dart';
import 'widget/filter_rating_widget.dart';

class ProductFilterScreen extends ConsumerStatefulWidget {
  const ProductFilterScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductFilterScreenState();
}

class _ProductFilterScreenState extends ConsumerState<ProductFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding,
          ),
          child: Column(
            children: const [
              FilterRangeWidget(),
              FilterRatingWidget(),
              Spacer(),
              ButtonWidget()
            ],
          ),
        ),
      ),
    );
  }
}
