import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../../../../provider/home_product_state.dart';
import 'product_item_widget.dart';

class ProductLayerWidget extends ConsumerWidget {
  const ProductLayerWidget({super.key});

  @override
  Widget build(context, ref) {
    final products = ref.watch(homeProductProviders);
    return (products.listProducts != null && products.listProducts!.isNotEmpty)
        ? LayoutGrid(
            columnGap: 20,
            rowGap: 20,
            columnSizes: repeat(2, [1.0.fr]),
            rowSizes:
                repeat((products.listProducts!.length / 2).ceil(), [auto]),
            children: products.listProducts!
                .map(
                  (item) => ProductItemWidget(
                      item.id, item.namevi, item.photo, item.regularPrice),
                )
                .toList(),
          )
        : const CircularProgressIndicator();
  }
}
