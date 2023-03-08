import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../loading/screen/widget/loading_widget.dart';
import '../../model/product_model.dart';
import '../../provider/product_detail_provider.dart';

class FavoriteWidget extends ConsumerWidget {
  const FavoriteWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(context, ref) {
    List<String> ratedDevices = [];

    final favoriteProviewder = ref.watch(productDetailFavoriteProviders);
    final favorite = favoriteProviewder.listProducts?.first ?? product;

    return Stack(
      alignment: Alignment.center,
      children: [
        TextButton(
          onPressed: () {
            ref.read(productDetailFavoriteProviders.notifier).toggleFavorite(
                int.parse(favorite.id), favorite.status.toString(), ref);
          },
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Icon(
            (favorite.status.isNotEmpty)
                ? Icons.favorite
                : Icons.favorite_border,
            size: 25,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const Positioned(
          child: LoadingWidget(),
        ),
      ],
    );
  }
}
