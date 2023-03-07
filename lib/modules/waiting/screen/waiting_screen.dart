import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getwidget/getwidget.dart';

import '../../../constants.dart';
import '../model/waiting_model.dart';
import '../widget/item_order_widget.dart';

class WaitingScreen extends ConsumerWidget {
  const WaitingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: const <Widget> [
              _infoOrder(),
              SizedBox(height: 20,),
              _infoProduct(),
              SizedBox(height: 20,),
              _requestSummary(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),child: GFButton(
        onPressed: (){},
        text: "Hủy đơn hàng",
        type: GFButtonType.outline,
        fullWidthButton: true,
        color: kTextColor,
        size: 45,
        textStyle: const TextStyle(color:kTextColor,fontSize: 14,),
      ),),
    );
  }
}

class _infoOrder extends StatelessWidget {
  const _infoOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(value: "", groupValue: "", onChanged: (index){}),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Chờ lấy hàng",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: kTextColor),),
                  SizedBox(height: 10),
                  Text("Đơn hàng của bạn đã xác nhận đang đợi lấy hàng",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700,color: bLtitle2Color),),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 25,),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 20,
              height: 16,
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset("assets/images/ship.png"),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Đơn hàng đã được đặt",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13,color: bLtitle2Color),),
                  SizedBox(height: 10,),
                  Text("Đơn hàng của bạn đã được đặt",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: bLtitle2Color),),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 20,
              height: 18,
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset("assets/images/Location.png"),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Bảo Ngọc",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13,color: bLtitle2Color),),
                  SizedBox(height: 10,),
                  Text("Địa chỉ: 123 Đường A, Phường B, Quận C, Tp. Hồ Chí Minh",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: bLtitle2Color),),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class _infoProduct extends StatelessWidget {
  const _infoProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Sản phẩm",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: kTextColor),),
        const SizedBox(height: 15,),
        AlignedGridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: orders.length,
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          itemBuilder: (context, index) => WaitingItem(
              waitingModel: orders[index]),
        ),
      ],
    );
  }
}

class _requestSummary extends StatelessWidget {
  const _requestSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RichText(text: const TextSpan(
                style: TextStyle(color: bLtitle2Color,fontSize: 14),
                children: [
                  TextSpan(text: "2 ",),
                  TextSpan(text: "Mặt hàng: ",),
                  TextSpan(text: "380.000",),
                  TextSpan(text: "đ",),
                ]
            )),
          ],
        ),
        const SizedBox(height: 15,),
        const Text("Tóm tắt yêu cầu",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: kTextColor),),
        const SizedBox(height: 15,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            const Text("Tổng phụ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: kTextLightColor),),
            RichText(text: const TextSpan(
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: kTextLightColor),
                children: [
                  TextSpan(text: "580.000",),
                  TextSpan(text: "đ",),
                ]
            )),
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Phí giao hàng",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: kTextLightColor),),
            RichText(text: const TextSpan(
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: kTextLightColor),
                children: [
                  TextSpan(text: "20.000",),
                  TextSpan(text: "đ",),
                ]
            )),
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Khuyến mãi",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: kTextLightColor),),
            RichText(text: const TextSpan(
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: kTextLightColor),
                children: [
                  TextSpan(text: "-",),
                  TextSpan(text: "20.000",),
                  TextSpan(text: "đ",),
                ]
            )),
          ],
        ),
        const SizedBox(height: 25,),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Tổng",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: kTextLightColor),),
            RichText(text: const TextSpan(
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: priceColor),
                children: [
                  TextSpan(text: "580.000",),
                  TextSpan(text: "đ",),
                ]
            )),
          ],
        ),
      ],
    );
  }
}



