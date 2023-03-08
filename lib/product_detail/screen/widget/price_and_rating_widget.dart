import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:thoitrang/product_detail/provider/product_detail_provider.dart';

import '../../../constants.dart';
import '../../model/product_model.dart';

class PriceAndRatingWidget extends ConsumerStatefulWidget {
  const PriceAndRatingWidget(this.product, {super.key});
  final ProductModel product;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PriceAndRatingWidgetState();
}

class _PriceAndRatingWidgetState extends ConsumerState<PriceAndRatingWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productRatings = ref.watch(productDetailRatingProviders);
    final productRating = productRatings.listProducts?.first;
    final imeiList = ref.watch(imeiListProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            int.parse(widget.product.regular_price) > 0
                ? NumberFormat.currency(
                    locale: 'vi_VN',
                    symbol: 'đ',
                  ).format(int.parse(widget.product.regular_price))
                : 'Liên hệ',
            style: const TextStyle(
              color: colorMain,
              fontSize: 18,
            ),
          ),
        ),
        RatingBar.builder(
          initialRating: double.parse(productRating?.rating.first.sao ??
              widget.product.rating.first.sao),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 18.0,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Color(0xFFFFC35B),
          ),
          onRatingUpdate: (rating) async {
            imeiList.when(
              data: (data) {
                if (data.isNotEmpty) {
                  if ((productRating != null &&
                          productRating.rating.first.imei.contains(data)) ||
                      widget.product.rating.first.imei.contains(data)) {
                    return AlertController.show("Thông báo",
                        'Bạn đã đánh giá sản phẩm này rồi', TypeAlert.error);
                  } else {
                    ref
                        .read(productDetailRatingProviders.notifier)
                        .handleRating(
                            widget.product.id, rating.toString(), data, ref);
                    return AlertController.show("Thông báo",
                        'Cảm ơn bạn đã đánh giá sản phẩm', TypeAlert.success);
                  }
                }
              },
              error: (error, stackTrace) => '',
              loading: () => '',
            );
          },
        ),
        const Padding(padding: EdgeInsets.only(right: 10)),
        Text(
          '${productRating?.rating.first.solan ?? widget.product.rating.first.solan} Reviews',
          style: const TextStyle(
            color: Color(0xFF999999),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
