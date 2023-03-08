import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/product_filter/layout_product.filter.dart';
import '../../icons/AppFonts_icons.dart';
import '../../constants.dart';

import 'widget/appbar_widget.dart';
import 'widget/product_widget.dart';

class ProductAllScreen extends ConsumerStatefulWidget {
  const ProductAllScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductAllScreenState();
}

class _ProductAllScreenState extends ConsumerState<ProductAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          defaultPadding, 0, defaultPadding, 0),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Hàng mới về",
                              style: TextStyle(
                                color: colorBlack,
                                fontFamily: 'UAB',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(AppFonts.sort),
                          ),
                          IconButton(
                            onPressed: () {
                              context.push(LayoutProductFilter.pathRoute);
                            },
                            icon: const Icon(AppFonts.filter),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 35,
                      color: Color(0xFFD9D9D9),
                      thickness: 1,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(defaultPadding, 0,
                          defaultPadding, defaultPadding * 2),
                      child: ProductWidget('/product'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
