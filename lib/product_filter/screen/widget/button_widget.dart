import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/product_filter/provider/product_filter.dart';

import '../../../constants.dart';
import '../../../product_all/provider/product_filter.dart';

class ButtonWidget extends ConsumerWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productFilter = ref.watch(productFilterProviders);
    final priceMin = productFilter.priceMin;
    final priceMax = productFilter.priceMax;
    final rating = productFilter.rating;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                ref.refresh(productFilterProviders);
                ref.read(productAllProviders.notifier).init("/product");
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFEFEFEF),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                "Xóa",
                style: TextStyle(
                  fontFamily: 'UAB',
                  color: colorMain,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextButton(
                onPressed: () {
                  ref.read(productFilterProviders.notifier).handleFilter(
                      priceMin: priceMin, priceMax: priceMax, rating: rating);

                  ref.read(productAllProviders.notifier).init("/product");
                  context.pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: colorMain,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Lọc",
                  style: TextStyle(
                    fontFamily: 'UAB',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
