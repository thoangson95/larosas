import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/cart_model.dart';
import 'cart_controller.dart';

// class CartState extends ChangeNotifier {
//   CartState({required this.ref});

//   final Ref ref;
//   List<CartModel> list = Hive.box<CartModel>('CartBox').values.toList();
//   var box = Hive.box<CartModel>('CartBox');
//   double total = 0;
//   int maxQty = 0;
//   bool isSelectAll = false;

//   Future<void> reCheckCart() async {
//     final listID = [];
//     for (var e in list) {
//       listID.add(e.productId);
//     }
//     final result = await ref.read(cartControllerProvider).reloadCart(listID.toString());
//     for (int i = 0; i < result.length; i++) {
//       var temp = box.values.firstWhere(
//         (element) => element.productId == result[i].productId,
//         orElse: () => CartModel(),
//       );
//       result[i].qty = temp.qty;
//       result[i].selected = temp.selected;
//     }
//     await box.clear();
//     await box.addAll(result);
//     reload();
//     caculateTotalAndMaxQty();
//     notifyListeners();
//   }

//   void addToCart({required CartModel item, required int qty}) {
//     int idx = list.indexWhere((e) => e.productId == item.productId);
//     if (idx > -1) {
//       list[idx].qty = (list[idx].qty) + qty;
//       box.putAt(idx, list[idx]);
//     } else {
//       box.add(CartModel(
//         name: item.name,
//         photo: item.photo,
//         price: item.price,
//         productId: item.productId,
//         selected: false,
//         qty: 1,
//       ));
//     }
//     reload();
//     caculateTotalAndMaxQty();
//     notifyListeners();
//   }

//   void removeFromCart({required CartModel item, required int qty}) {
//     int idx = list.indexWhere((e) => e.productId == item.productId);
//     if (idx > -1) {
//       if ((list[idx].qty - qty) > 0) {
//         list[idx].qty = list[idx].qty - qty;
//         box.putAt(idx, list[idx]);
//       } else {
//         box.deleteAt(idx);
//       }
//       reload();
//       caculateTotalAndMaxQty();
//       notifyListeners();
//     }
//   }

//   void selectItem({required int id}) {
//     int idx = list.indexWhere((e) => e.productId == id);
//     if (idx > -1) {
//       list[idx].selected = !list[idx].selected;
//       box.putAt(idx, list[idx]);
//       caculateTotalAndMaxQty();
//       notifyListeners();
//     }
//   }

//   void selecteAll() {
//     for (int i = 0; i < list.length; i++) {
//       list[i].selected = !isSelectAll;
//       box.values.elementAt(i).selected = !isSelectAll;
//     }
//     isSelectAll = !isSelectAll;
//     caculateTotalAndMaxQty();
//     notifyListeners();
//   }

//   void reload() {
//     list = Hive.box<CartModel>('CartBox').values.toList();
//   }

//   void caculateTotalAndMaxQty() {
//     total = 0;
//     maxQty = 0;
//     for (var e in list.where((element) => element.selected == true)) {
//       total += e.price * e.qty;
//       maxQty += e.qty;
//     }
//   }
// }

class CartState {
  List<CartModel> list;
  var box = Hive.box<CartModel>('CartBox');
  double total;
  int maxQty;
  bool isSelectAll;
  CartState({required this.list, this.total = 0, this.maxQty = 0, this.isSelectAll = false});

  CartState copyWith({List<CartModel>? list, double? total, int? maxQty, bool? isSelectAll}) {
    return CartState(list: list ?? this.list, isSelectAll: isSelectAll ?? this.isSelectAll, total: total ?? this.total, maxQty: maxQty ?? this.maxQty);
  }
}

class CartNotifier extends Notifier<CartState> {
  @override
  CartState build() {
    final list = Hive.box<CartModel>('CartBox').values.toList();
    return CartState(list: list);
  }

  Future<void> reCheckCart() async {
    if (state.list.isNotEmpty) {
      final listID = [];
      for (var e in state.list) {
        listID.add(e.productId);
      }
      final result = await ref.read(cartControllerProvider).reloadCart(listID.toString());
      for (int i = 0; i < result.length; i++) {
        var temp = state.box.values.firstWhere(
          (element) => element.productId == result[i].productId,
          orElse: () => CartModel(),
        );
        result[i].qty = temp.qty;
        result[i].selected = temp.selected;
      }
      await state.box.clear();
      await state.box.addAll(result);
      reload();
      caculateTotalAndMaxQty();
      state = state.copyWith();
    }
  }

  void clear() {
    state.box.values.where((e) => e.selected == true).forEach((e) {
      e.delete();
    });
    reload();
    state = state.copyWith();
  }

  void addToCart({required CartModel item, required int qty}) {
    int idx = state.list.indexWhere((e) => e.productId == item.productId);
    if (idx > -1) {
      state.list[idx].qty = (state.list[idx].qty) + qty;
      state.box.putAt(idx, state.list[idx]);
    } else {
      state.box.add(CartModel(
        name: item.name,
        photo: item.photo,
        price: item.price,
        productId: item.productId,
        selected: false,
        qty: 1,
      ));
    }
    caculateTotalAndMaxQty();
    reload();
    state = state.copyWith();
  }

  void removeFromCart({required CartModel item, required int qty}) {
    int idx = state.list.indexWhere((e) => e.productId == item.productId);
    if (idx > -1) {
      if ((state.list[idx].qty - qty) > 0) {
        state.list[idx].qty = state.list[idx].qty - qty;
        state.box.putAt(idx, state.list[idx]);
      } else {
        state.box.deleteAt(idx);
      }
      caculateTotalAndMaxQty();
      reload();
      state = state.copyWith();
    }
  }

  void selectItem({required int id}) {
    int idx = state.list.indexWhere((e) => e.productId == id);
    if (idx > -1) {
      state.list[idx].selected = !state.list[idx].selected;
      state.box.putAt(idx, state.list[idx]);
      caculateTotalAndMaxQty();
      reload();
      state = state.copyWith();
    }
  }

  void selecteAll() {
    for (int i = 0; i < state.list.length; i++) {
      state.list[i].selected = !state.isSelectAll;
      state.box.values.elementAt(i).selected = !state.isSelectAll;
    }
    state.isSelectAll = !state.isSelectAll;
    caculateTotalAndMaxQty();
    reload();
    state = state.copyWith();
  }

  void reload() {
    state.list = Hive.box<CartModel>('CartBox').values.toList();
  }

  void caculateTotalAndMaxQty() {
    state.total = 0;
    state.maxQty = 0;
    for (var e in state.list.where((element) => element.selected == true)) {
      state.total += e.price * e.qty;
      state.maxQty += e.qty;
    }
  }
}
