import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../provider/home_product_state.dart';

class FavoriteProductWidget extends ConsumerStatefulWidget {
  final String id;

  const FavoriteProductWidget(this.id, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavoriteProductWidgetState();
}

class _FavoriteProductWidgetState extends ConsumerState<FavoriteProductWidget> {
  bool isFav = false;

  @override
  Widget build(context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: IconButton(
        autofocus: true,
        alignment: Alignment.topCenter,
        icon: const Icon(
          Icons.favorite_border_rounded,
          color: Colors.red,
          size: 18,
        ),
        onPressed: () async {
          FavoriteProducts().addFavorite(widget.id.toString());
        },
      ),
    );
  }
}
