import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' as intl;

import '../../model/cart_model.dart';
import '../../provider/cart_controller.dart';

class CartItemWidget extends ConsumerWidget {
  const CartItemWidget({Key? key, required this.item}) : super(key: key);

  final CartModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = item.selected;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 24,
          height: 24,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(4)), color: isChecked ? const Color(0xffFF7465) : const Color(0xffEAEAEA)),
          child: Checkbox(
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return const Color(0xffFF7465);
              }
              return const Color(0xffEAEAEA);
            }),
            value: isChecked,
            onChanged: (value) {
              ref.read(cartState.notifier).selectItem(id: item.productId);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: SizedBox(
              width: 80,
              height: 80,
              child: Image.network(
                item.photo,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                item.name,
                style: const TextStyle(fontSize: 12, height: 16 / 12, color: Color(0xff373737)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),

              // Price
              Text(
                "${intl.NumberFormat.decimalPattern().format(item.price)}đ",
                style: const TextStyle(color: Color(0xffFF7465), fontSize: 14, height: 19 / 14),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  onTap: () {
                    ref.read(cartState.notifier).removeFromCart(item: item, qty: 1);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffDDDDE3),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Color(0xff6C6C6C),
                      size: 24,
                    ),
                  ),
                ),
              ),
              Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(border: Border.all(color: const Color(0xffDDDDE3), width: 1), borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: Text(
                  "${item.qty}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xff6C6C6C), fontSize: 12, height: 1.5),
                ),
              ),
              InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                onTap: () {
                  ref.read(cartState.notifier).addToCart(item: item, qty: 1);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color(0xffDDDDE3),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xff6C6C6C),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
