import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:intl/intl.dart' as intl;

import '../../../constants.dart';
import '../provider/cart_controller.dart';
import 'widget/cart_detail_product_list_widget.dart';
import 'widget/thoi_gian_nhan_widget.dart';

class CartDetailScreen extends ConsumerWidget {
  const CartDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listProduct = ref.watch(cartNotifierProvider).list.where((element) => element.selected == true).toList();
    final data = ref.watch(cartNotifierProvider);
    final cartNotEmpty = listProduct.isNotEmpty;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thanh toán",
          style: TextStyle(
            fontSize: 16,
            height: 23 / 16,
            color: Color(0xff222222),
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thông tin nhận hàng
              Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Thông tin nhận hàng",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff171717),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 123,
                      height: 36,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xff7A7D8A),
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Thêm địa chỉ mới",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff171717),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 14),
                child: SizedBox(
                  height: 30,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Bạn chưa có địa chỉ nhận hàng bấm thêm địa chỉ mới",
                        style: TextStyle(
                          color: Color(0xff7A7D8A),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Thời gian nhận hàng
              Container(
                margin: const EdgeInsets.only(bottom: 19),
                child: const Text(
                  "Thời gian nhận hàng",
                  strutStyle: StrutStyle(fontSize: 13, height: 30 / 13, leading: 17 / 13),
                  style: TextStyle(color: Color(0xff171717), fontWeight: FontWeight.w700),
                ),
              ),
              const ThoiGianNhanWidget(),

              // Ghi chú đơn hàng
              const Text(
                "Ghi chú đơn hàng",
                strutStyle: StrutStyle(height: 30 / 13, leading: 17 / 13),
                style: TextStyle(fontSize: 13, color: Color(0xff171717), fontWeight: FontWeight.w700),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                decoration: const BoxDecoration(
                  color: Color(0xffF2F2F2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: const TextField(
                  maxLines: 3,
                  decoration: InputDecoration.collapsed(hintText: "Bạn có vấn đề gì cần ghi chú vào đây", hintStyle: TextStyle(fontSize: 10, height: 2, color: Color(0xff7A7D8A))),
                ),
              ),

              // Sản phẩm
              CartDetailProductList(listProduct: listProduct),

              // Voucher
              Container(
                margin: const EdgeInsets.only(top: 22, bottom: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "VOUCHER10%",
                      strutStyle: StrutStyle(fontSize: 15, height: 1, leading: 1),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: const [
                          Text(
                            "Chọn hoặc nhập mã",
                            strutStyle: StrutStyle(fontSize: 10, height: 1, leading: 2),
                            style: TextStyle(color: Color(0xff7A7D8A)),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 13,
                            color: Color(0xff7A7D8A),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // Thông tin đơn hàng
              const Text(
                "Thông tin đơn hàng",
                strutStyle: StrutStyle(fontSize: 13, height: 30 / 13, leading: 27 / 13),
                style: TextStyle(color: Color(0xff171717), fontWeight: FontWeight.w700),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Tổng tiền hàng",
                      strutStyle: StrutStyle(fontSize: 12, height: 20 / 12, leading: 8 / 12),
                      style: TextStyle(color: Color(0xff7A7D8A)),
                    ),
                    Text(
                      "${intl.NumberFormat.decimalPattern().format(data.total)}đ",
                      strutStyle: const StrutStyle(fontSize: 13, height: 20 / 13, leading: 7 / 13),
                      style: const TextStyle(color: colorMain),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Phí giao hàng",
                      strutStyle: StrutStyle(fontSize: 12, height: 20 / 12, leading: 8 / 12),
                      style: TextStyle(color: Color(0xff7A7D8A)),
                    ),
                    Text(
                      "0đ",
                      strutStyle: StrutStyle(fontSize: 12, height: 20 / 12, leading: 8 / 13),
                      style: TextStyle(color: Color(0xff7A7D8A)),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Khuyến mãi",
                      strutStyle: StrutStyle(fontSize: 12, height: 20 / 12, leading: 8 / 12),
                      style: TextStyle(color: Color(0xff7A7D8A)),
                    ),
                    Text(
                      "-0đ",
                      strutStyle: StrutStyle(fontSize: 12, height: 20 / 12, leading: 8 / 13),
                      style: TextStyle(color: Color(0xff7A7D8A)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 36, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Tạm tính: ${intl.NumberFormat.decimalPattern().format(data.total)}đ",
                    style: const TextStyle(fontSize: 13, height: 20 / 13, color: colorMain, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "(${data.maxQty} sản phẩm)",
                    style: const TextStyle(fontSize: 10, height: 2, color: Color(0xff7A7D8A)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 42,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  if (cartNotEmpty) {
                    // context.push("/cart-success");
                    alert(context, const Text("Thông báo"), const Text("Đang tải"), []);
                    String param = jsonEncode(listProduct);
                    ref.read(cartControllerProvider).saveCart(param).then((value) {
                      if (value) {
                        context.pop();
                        context.push("/cart-success");
                      } else {
                        alert(context, const Text("Cảnh báo"), const Text("Đặt hàng thất bại, vui lòng thử lại sau"), [
                          TextButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: const Text("OK"))
                        ]);
                      }
                    });
                  } else {
                    alert(context, const Text("Cảnh báo"), const Text("Chưa có sản phẩn nào được chọn"), [
                      TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text("OK"))
                    ]);
                  }
                },
                style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: (cartNotEmpty) ? colorMain : const Color.fromARGB(255, 87, 87, 91), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  "Đặt hàng",
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 13, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
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
