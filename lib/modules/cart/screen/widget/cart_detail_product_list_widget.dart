import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' as intl;

import '../../model/cart_model.dart';

class CartDetailProductList extends ConsumerStatefulWidget {
  const CartDetailProductList({Key? key, required this.listProduct}) : super(key: key);

  final List<CartModel> listProduct;

  @override
  CartDetailProductListState createState() => CartDetailProductListState();
}

class CartDetailProductListState extends ConsumerState<CartDetailProductList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.listProduct
          .map((e) => Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.network(
                            e.photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          e.name,
                          style: const TextStyle(fontSize: 12, height: 16 / 12, color: Color(0xff373737)),
                        ),
                        Text(
                          "${intl.NumberFormat.decimalPattern().format(e.price)}đ",
                          style: const TextStyle(
                            fontSize: 14,
                            height: 19 / 14,
                            color: Color(0xffFF7465),
                          ),
                        ),
                        Text(
                          "X${e.qty}",
                          style: const TextStyle(color: Color(0xff7A7D8A), fontSize: 13, height: 20 / 13),
                        )
                      ],
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
