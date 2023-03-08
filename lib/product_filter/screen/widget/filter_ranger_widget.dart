import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitrang/product_filter/provider/product_filter.dart';

import '../../../constants.dart';

class FilterRangeWidget extends ConsumerWidget {
  const FilterRangeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productFilter = ref.watch(productFilterProviders);
    final minValue = productFilter.priceMin;
    final maxValue = productFilter.priceMax;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "Khoảng giá",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "UAB",
                ),
              ),
              Text(
                "${minValue ?? 0}k ~ ${maxValue ?? 1600}k",
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "UAB",
                  fontSize: 12,
                ),
              ),
            ],
          ),
          FlutterSlider(
            values: [minValue ?? 0, maxValue ?? 1600],
            rangeSlider: true,
            max: 1600,
            min: 0,
            tooltip: FlutterSliderTooltip(
              disabled: true,
            ),
            handler: FlutterSliderHandler(
              decoration: const BoxDecoration(
                color: Color(0x000000ff),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: colorMain,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
            rightHandler: FlutterSliderHandler(
              decoration: const BoxDecoration(
                color: Color(0x000000ff),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: colorMain,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
            selectByTap: true,
            trackBar: const FlutterSliderTrackBar(
                activeTrackBar: BoxDecoration(
                  color: colorMain,
                ),
                inactiveTrackBar: BoxDecoration(
                  color: Color(0xffD9D9D9),
                )),
            step: const FlutterSliderStep(step: 50),
            onDragging: (handlerIndex, lowerValue, upperValue) {
              ref
                  .read(productFilterProviders.notifier)
                  .handleFilter(priceMin: lowerValue, priceMax: upperValue);
            },
          ),
        ],
      ),
    );
  }
}
