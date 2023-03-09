import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartSuccessScreen extends StatelessWidget {
  const CartSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void goToOrder() {
      context.push("/order");
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 26),
                child: Image.asset(
                  "assets/images/cart-success.png",
                  width: 114,
                  height: 115,
                  fit: BoxFit.fill,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Đặt Hàng Thành Công",
                  strutStyle: StrutStyle(fontSize: 20, leading: 6 / 20),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff222222),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Text(
                  "Đơn hàng của bạn đã được đặt thành công để biết thêm chi tiết đi đến đơn đặt hàng của tôi.",
                  softWrap: true,
                  style: TextStyle(color: Color(0xff747474)),
                  textAlign: TextAlign.center,
                  strutStyle: StrutStyle(fontSize: 12, height: 25 / 12),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 46,
                        child: ElevatedButton(
                          onPressed: goToOrder,
                          style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: const Color(0xFFFF7465), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "Xem đơn hàng",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
