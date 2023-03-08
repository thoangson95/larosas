import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../product_detail/layout_product_detail.dart';
import '../../../product_detail/provider/product_detail_provider.dart';
import '../../model/product_model.dart';
import '../../../loading/screen/widget/loading_widget.dart';
import 'favorite_widget.dart';

class GridProductWidget extends ConsumerWidget {
  const GridProductWidget({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(productDetailProviders, (previous, next) {
      if (next.isLoading == false) {
        context.push(
            '${LayoutProductDeatil.pathRoute}/${next.listProducts?.first.id}');
        ref.read(isLoadingProvider.notifier).state = false;
      }
    });
    return Stack(
      children: [
        LayoutGrid(
          columnGap: 20,
          rowGap: 20,
          columnSizes: repeat(2, [1.0.fr]),
          rowSizes: repeat((products.length / 2).ceil(), [auto]),
          children: products
              .map(
                (item) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        ref
                            .read(productDetailProviders.notifier)
                            .init('/product?id=${item.id}');
                        ref.read(isLoadingProvider.notifier).state = true;
                      },
                      child: AspectRatio(
                        aspectRatio: 33 / 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Hero(
                            tag: item.id,
                            child: Image.network(
                              item.photo,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF373737),
                                      height: 1.5,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    softWrap: true,
                                  ),
                                ),
                                FavoriteWidget(product: item),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: Text(
                                int.parse(item.regular_price) > 0
                                    ? NumberFormat.currency(
                                        locale: 'vi_VN',
                                        symbol: 'đ',
                                      ).format(int.parse(item.regular_price))
                                    : 'Liên hệ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
