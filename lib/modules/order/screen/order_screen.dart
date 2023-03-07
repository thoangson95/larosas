import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../constants.dart';
import '../model/order_model.dart';
import '../widget/item_order_widget.dart';

class HomeOrder extends ConsumerWidget {
  const HomeOrder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Container(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: const <Widget> [
              _Categories(),
              SizedBox(height: 20,),
              _DateOrder(),
              SizedBox(height: 20,),
              _viewOrder(),
            ],
          ),
        ),
      ),
    );
  }
}

AppBar buildAppBar(){
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    title: Text('Đơn hàng',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: bLtitleColor),),
  );
}

class _Categories extends ConsumerStatefulWidget {
  const _Categories({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => __CategoriesState();
}

class __CategoriesState extends ConsumerState<_Categories> {
  List<String> categories = ["Tất cả","Chờ xác nhận","Chờ lấy hàng","Đang giao","Đã giao"];
  int selectedIndex  = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }
  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
                fontSize: 12,

              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              height: 2,
              width: 30,

              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

class _DateOrder extends StatelessWidget {
  const _DateOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: 50,
          padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0),
          decoration: BoxDecoration(
              color: grayColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: const <Widget> [
              Expanded(child: Text("Ngày giao dự kiến",style: TextStyle(color: bLtitle2Color,fontSize: 12) ,textAlign: TextAlign.left,)),
              Expanded(child: Text("Nov 18 - Oct 30",style: TextStyle(color: kTextColor,fontSize: 15,fontWeight: FontWeight.w700),textAlign: TextAlign.right,)),
            ],
          ),
        )
      ],
    );
  }
}

class _viewOrder extends StatelessWidget {
  const _viewOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 15,),
        AlignedGridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: orders.length,
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          itemBuilder: (context, index) => OrderItem(
              orderModel: orders[index]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RichText(text: const TextSpan(
                style: TextStyle(color: bLtitle2Color,fontSize: 14),
                children: [
                  TextSpan(text: "3 ",),
                  TextSpan(text: "Mặt hàng: ",),
                  TextSpan(text: "290.000",),
                  TextSpan(text: "đ",),
                ]
            )),
          ],
        ),
        SizedBox(height: 30,)
      ],
    );
  }
}




