import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../model/cart_model.dart';
import 'cart_controller.dart';

class CartState extends ChangeNotifier {
  CartState({required this.ref});

  final Ref ref;
  List<CartModel> list = Hive.box<CartModel>('CartBox').values.toList();
  var box = Hive.box<CartModel>('CartBox');
  double total = 0;
  int maxQty = 0;
  bool isSelectAll = false;

  Future<void> reCheckCart() async {
    final listID = [];
    for (var e in list) {
      listID.add(e.productId);
    }
    final result =
        await ref.read(cartControllerProvider).reloadCart(listID.toString());
    for (int i = 0; i < result.length; i++) {
      var temp = box.values.firstWhere(
        (element) => element.productId == result[i].productId,
        orElse: () => CartModel(),
      );
      result[i].qty = temp.qty;
      result[i].selected = temp.selected;
    }
    await box.clear();
    await box.addAll(result);
    reload();
    caculateTotalAndMaxQty();
    notifyListeners();
  }

  void addToCart({required CartModel item, required int qty}) {
    int idx = list.indexWhere((e) => e.productId == item.productId);
    if (idx > -1) {
      list[idx].qty = (list[idx].qty) + qty;
      box.putAt(idx, list[idx]);
    } else {
      box.add(CartModel(
        name: item.name,
        photo: item.photo,
        price: item.price,
        productId: item.productId,
        selected: false,
        qty: 1,
      ));
    }
    reload();
    caculateTotalAndMaxQty();
    notifyListeners();
  }

  void removeFromCart({required CartModel item, required int qty}) {
    int idx = list.indexWhere((e) => e.productId == item.productId);
    if (idx > -1) {
      if ((list[idx].qty - qty) > 0) {
        list[idx].qty = list[idx].qty - qty;
        box.putAt(idx, list[idx]);
      } else {
        box.deleteAt(idx);
      }
      reload();
      caculateTotalAndMaxQty();
      notifyListeners();
    }
  }

  void selectItem({required int id}) {
    int idx = list.indexWhere((e) => e.productId == id);
    if (idx > -1) {
      list[idx].selected = !list[idx].selected;
      box.putAt(idx, list[idx]);
      caculateTotalAndMaxQty();
      notifyListeners();
    }
  }

  void selecteAll() {
    for (int i = 0; i < list.length; i++) {
      list[i].selected = !isSelectAll;
      box.values.elementAt(i).selected = !isSelectAll;
    }
    isSelectAll = !isSelectAll;
    caculateTotalAndMaxQty();
    notifyListeners();
  }

  void reload() {
    list = Hive.box<CartModel>('CartBox').values.toList();
  }

  void caculateTotalAndMaxQty() {
    total = 0;
    maxQty = 0;
    for (var e in list.where((element) => element.selected == true)) {
      total += e.price * e.qty;
      maxQty += e.qty;
    }
  }
}
