import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

import '../provider/cart_controller.dart';
import 'widget/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 16,
            height: 23 / 16,
            color: Color(0xff222222),
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer(builder: (context, ref, child) {
        final data = ref.watch(cartState).list;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: data
                  .map((e) => Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: CartItemWidget(
                          item: e,
                        ),
                      ))
                  .toList(),
            ),
          ),
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 36, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final isCheckAll = ref.watch(cartState).isSelectAll;
                return Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(4)),
                          border: Border.all(
                            color: isCheckAll ? const Color(0xffFF7465) : const Color(0xffEAEAEA),
                            width: 1,
                          ),
                          color: isCheckAll ? const Color(0xffFF7465) : null),
                      child: Checkbox(
                        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return const Color(0xffFF7465);
                          }
                          return const Color(0xffffffff);
                        }),
                        value: isCheckAll,
                        onChanged: (value) {
                          ref.read(cartState.notifier).selecteAll();
                        },
                      ),
                    ),
                    const Text(
                      "Tất cả",
                      style: TextStyle(fontSize: 12, height: 20 / 12, color: Color(0xff171717)),
                    ),
                  ],
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                ref.read(cartState.notifier).caculateTotalAndMaxQty();
                final total = ref.watch(cartState).total;
                final qty = ref.watch(cartState).maxQty;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Tạm tính: ${intl.NumberFormat.decimalPattern().format(total)}đ",
                      style: const TextStyle(fontSize: 13, height: 20 / 13, color: Color(0xffFC5C3C), fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "($qty sản phẩm)",
                      style: const TextStyle(fontSize: 10, height: 2, color: Color(0xff7A7D8A)),
                    )
                  ],
                );
              },
            ),
            SizedBox(
              height: 42,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  context.push('/cart-detail');
                },
                style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: const Color(0xFFFF7465), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
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
}
