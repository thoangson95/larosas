import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../model/order_model.dart';


class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.orderModel}) : super(key: key);

  final OrderModel  orderModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(orderModel.image,width: double.maxFinite,height: 90, fit: BoxFit.fill,),
          ),
        ),
        const SizedBox(width: 15,),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(orderModel.title,style: TextStyle(color: backtitleColor,fontSize: 15),),
              SizedBox(height: 10,),
              RichText(text: TextSpan(
                  style: TextStyle(color: priceColor,fontSize: 18),
                  children: [
                    TextSpan(text: orderModel.price.toString(),),
                    TextSpan(text: "đ",),
                  ]
              )),
              SizedBox(height: 10,),
              RichText(text: const TextSpan(
                  style: TextStyle(color: bLtitle2Color,fontSize: 15),
                  children: [
                    TextSpan(text: "x",),
                    TextSpan(text: "1",),
                  ]
              )),
            ],
          ),
        ),
      ],
    );
  }
}
