import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants.dart';
import '../../icons/AppFonts_icons.dart';
import '../provider/product_detail_provider.dart';
import 'widget/favorite_widget.dart';
import 'widget/pic_widget.dart';
import 'widget/price_and_rating_widget.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final String id;
  const ProductDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productDetailProviders);
    final product = products.listProducts!.first;

    final List<String> gallerys = [
      product.photo,
      ...product.gallery,
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(AppFonts.bag),
            color: Colors.black,
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            splashColor: Colors.transparent,
          ),
        ],
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PicWidget(gallerys: gallerys, widget: widget, product: product),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 20,
                        ),
                      ),
                      FavoriteWidget(product: product),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  PriceAndRatingWidget(product),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
