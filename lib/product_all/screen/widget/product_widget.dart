import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/product_filter.dart';
import 'gird_product_widget.dart';

class ProductWidget extends ConsumerStatefulWidget {
  final String url;
  const ProductWidget(this.url, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends ConsumerState<ProductWidget> {
  @override
  void initState() {
    super.initState();
    ref.read(productAllProviders.notifier).init(widget.url);
  }

  @override
  Widget build(context) {
    final products = ref.watch(productAllProviders);
    return (products.listProducts != null && products.listProducts!.isNotEmpty)
        ? GridProductWidget(products: products.listProducts!)
        : const Text("Không tìm thấy sản phẩm");
  }
}
