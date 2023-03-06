import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_state.dart';

final cartState = ChangeNotifierProvider((ref) => CartState());
