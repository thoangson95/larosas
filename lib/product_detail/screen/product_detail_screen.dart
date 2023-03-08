import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../cart/model/cart_model.dart';
import '../../cart/provider/cart_controller.dart';
import '../../constants.dart';
import '../provider/product_detail_provider.dart';
import 'widget/custom_radio_color_picker.dart';
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
    final List<RadioColorPickerModel> sampleData = [
      RadioColorPickerModel(false, const Color(0xff000000)),
      RadioColorPickerModel(false, const Color(0xffA5593C)),
      RadioColorPickerModel(false, const Color(0xff687A61)),
      RadioColorPickerModel(false, const Color(0xffAFAFAF)),
      RadioColorPickerModel(false, const Color(0xff276AE1)),
    ];

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
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            onPressed: () {
              context.push("/cart");
            },
            icon: SvgPicture.asset("assets/images/bag.svg"),
            iconSize: 22,
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              margin: const EdgeInsets.only(top: 21, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: Text(
                      "Màu sắc",
                      style: TextStyle(
                        fontSize: 13,
                        height: 25 / 13,
                        color: Color(0xff222222),
                      ),
                    ),
                  ),
                  CustomRadioColorPicker(listModel: sampleData)
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 37),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        ref.read(cartState.notifier).addToCart(
                            item: CartModel(
                              price: int.parse(product.regular_price),
                              name: product.name,
                              photo: product.photo,
                              productId: int.parse(product.id),
                            ),
                            qty: 1);
                        alert(context, const Text("Thêm thành công"),
                            const Text("Đã thêm vào giỏ hàng"), [
                          TextButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: const Text("ok"))
                        ]);
                      },
                      icon: SvgPicture.asset(
                        "assets/images/bag.svg",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(cartState.notifier).addToCart(
                            item: CartModel(
                              price: int.parse(product.regular_price),
                              name: product.name,
                              photo: product.photo,
                              productId: int.parse(product.id),
                            ),
                            qty: 1);
                        context.push("/cart");
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xFFFF7465),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        "Mua ngay",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                            height: 1.4,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

Future<void> alert(
    BuildContext context, Text title, Text content, List<Widget>? action) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title,
        content: content,
        actions: action ?? action,
      );
    },
  );
}
