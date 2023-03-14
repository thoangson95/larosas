import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:larosas/modules/cart/provider/cart_controller.dart';

import '../../cart/model/cart_model.dart';
import '../provider/product_detail_controller.dart';
import 'widget/custom_radio_color_picker.dart';
import 'widget/star_metter_widget.dart';

class ProdcutDetailScreen extends ConsumerWidget {
  const ProdcutDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<RadioColorPickerModel> sampleData = [
      RadioColorPickerModel(false, const Color(0xff000000)),
      RadioColorPickerModel(false, const Color(0xffA5593C)),
      RadioColorPickerModel(false, const Color(0xff687A61)),
      RadioColorPickerModel(false, const Color(0xffAFAFAF)),
      RadioColorPickerModel(false, const Color(0xff276AE1)),
    ];
    final data = ref.watch(productDetailProvider);
    return data.when(
      data: (data) => Scaffold(
        appBar: AppBar(
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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: 'product-animation-${data.id}',
                child: SizedBox(
                  width: double.infinity,
                  height: 370,
                  child: Image.network(
                    data.photo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Nội dung
              Container(
                padding: const EdgeInsets.only(bottom: 22),
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(
                      width: 1,
                      color: Color(0xffEAEAEA),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                data.namevi,
                                style: const TextStyle(
                                  fontSize: 20,
                                  height: 27 / 20,
                                  color: Color(0xff222222),
                                  fontWeight: FontWeight.w700,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            // const FavoriteIcon(),
                            // IconButton(
                            //   onPressed: () {
                            //     // setState(() {
                            //     //   ref.read(productState.notifier).toggleFav(model: ProductCardModel(id: data.id));
                            //     //   ref.refresh(productCardProvider);
                            //     //   ref.refresh(homeProductCardProvider);
                            //     // });
                            //   },
                            //   // icon: Icon(
                            //   //   ref.watch(productState.notifier).checkFav(id: data.id) ? Icons.favorite : Custom.heart,
                            //   //   color: const Color(0xffFF7465),
                            //   // ),
                            // )
                          ],
                        ),
                      ),

                      // Giá
                      Container(
                        margin: const EdgeInsets.only(bottom: 19),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${intl.NumberFormat.decimalPattern().format(data.regularPrice)}đ",
                              style: const TextStyle(
                                fontSize: 18,
                                height: 25 / 18,
                                color: Color(0xffFF7465),
                              ),
                            ),
                            Row(
                              children: const [
                                StarMetterWidget(
                                  score: 4.4,
                                ),
                                Text(
                                  "356 Reviews",
                                  style: TextStyle(
                                    fontSize: 13,
                                    height: 18 / 13,
                                    color: Color(0xff999999),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          data.descvi,
                          style: const TextStyle(
                            fontSize: 12,
                            height: 25 / 12,
                            color: Color(0xff979797),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Màu sắc
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
                          ref.read(cartNotifierProvider.notifier).addToCart(item: CartModel(price: data.regularPrice, name: data.namevi, photo: data.photo, productId: data.id), qty: 1);
                          alert(context, const Text("Thêm thành công"), const Text("Đã thêm vào giỏ hàng"), [
                            TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: const Text("ok"))
                          ]);
                        },
                        icon: SvgPicture.asset("assets/images/bag.svg"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () {
                          ref.read(cartNotifierProvider.notifier).addToCart(item: CartModel(price: data.regularPrice, name: data.namevi, photo: data.photo, productId: data.id), qty: 1);
                          context.push("/cart");
                        },
                        style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: const Color(0xFFFF7465), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "Mua ngay",
                          style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14, height: 1.4, fontWeight: FontWeight.w700),
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
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(child: Text(error.toString())),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Future<void> alert(BuildContext context, Text title, Text content, List<Widget>? action) {
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
}
