import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitrang/product_filter/provider/product_filter.dart';

class FilterRatingWidget extends ConsumerWidget {
  const FilterRatingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productFilter = ref.watch(productFilterProviders);
    final filterRating = productFilter.rating;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 55,
          ),
          const Text(
            "Đánh giá",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'UAB',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          RatingBar.builder(
            initialRating: filterRating ?? 0,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemPadding: const EdgeInsets.only(right: 10),
            itemCount: 5,
            itemSize: 50.0,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Color(0xFFFFC35B),
            ),
            onRatingUpdate: (rating) {
              ref
                  .read(productFilterProviders.notifier)
                  .handleFilter(rating: rating);
            },
          ),
        ],
      ),
    );
  }
}
