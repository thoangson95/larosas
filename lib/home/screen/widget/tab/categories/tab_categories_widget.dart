import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../provider/home_categories_state.dart';
import 'categories_item_widget.dart';

class TabCategoriesWidget extends ConsumerWidget {
  const TabCategoriesWidget({super.key});

  @override
  Widget build(context, ref) {
    final categories = ref.watch(homeCategoriesProviders);
    return (categories.listCategories != null &&
            categories.listCategories!.isNotEmpty)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: categories.listCategories!
                  .map(
                    (item) =>
                        CategoriesItemWidget(item.id, item.namevi, item.photo),
                  )
                  .toList(),
            ),
          )
        : const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(child: CircularProgressIndicator()));
  }
}
