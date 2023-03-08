import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/product_model.dart';
import '../../provider/product_home_provider.dart';

class FavoriteWidget extends ConsumerWidget {
  const FavoriteWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(context, ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: TextButton(
        onPressed: () {
          ref
              .read(productHomeProviders.notifier)
              .toggleFavorite(int.parse(product.id), product.status.toString());
        },
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Icon(
          (product.status.isNotEmpty) ? Icons.favorite : Icons.favorite_border,
          size: 15,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
