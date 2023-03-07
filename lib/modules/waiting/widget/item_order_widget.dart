import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../model/waiting_model.dart';



class WaitingItem extends StatelessWidget {
  const WaitingItem({Key? key, required this.waitingModel}) : super(key: key);

  final WaitingModel  waitingModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(waitingModel.image,width: double.maxFinite,height: 90, fit: BoxFit.fill,),
          ),
        ),
        const SizedBox(width: 15,),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(waitingModel.title,style: TextStyle(color: backtitleColor,fontSize: 15),),
              SizedBox(height: 10,),
              RichText(text: TextSpan(
                  style: TextStyle(color: priceColor,fontSize: 18),
                  children: [
                    TextSpan(text: waitingModel.price.toString(),),
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
