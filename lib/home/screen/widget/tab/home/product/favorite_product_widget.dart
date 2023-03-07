// ignore_for_file: dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../../provider/home_product_state.dart';

class FavoriteProductWidget extends ConsumerStatefulWidget {
  final String id;

  const FavoriteProductWidget(this.id, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavoriteProductWidgetState();
}

class _FavoriteProductWidgetState extends ConsumerState<FavoriteProductWidget> {
  late bool isFav = false;
  late final Box box;

  @override
  void initState() {
    super.initState();
    box = Hive.box('favorite_products');
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(context) {
    late final isFav = FavoriteProducts().isFavorite(widget.id);
    Key key = ValueKey(isFav);
    return FutureBuilder(
      key: key,
      future: isFav,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var data = snapshot.data as bool;
          if (data) {
            return SizedBox(
              width: 35,
              height: 35,
              child: IconButton(
                autofocus: true,
                alignment: Alignment.topCenter,
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 18,
                ),
                onPressed: () async {
                  FavoriteProducts().addFavorite(widget.id.toString());
                },
              ),
            );
          } else {
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
        } else {
          return const Center(child: CupertinoActivityIndicator());
        }
      },
    );
  }
}
