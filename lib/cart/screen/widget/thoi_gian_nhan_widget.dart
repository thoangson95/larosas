import 'package:flutter/material.dart';

class ThoiGianNhanHangModel {
  bool isactive;
  String name;
  String desc;
  ThoiGianNhanHangModel({required this.isactive, required this.name, required this.desc});
}

class ThoiGianNhanWidget extends StatefulWidget {
  const ThoiGianNhanWidget({Key? key}) : super(key: key);

  @override
  State<ThoiGianNhanWidget> createState() => _ThoiGianNhanWidgetState();
}

class _ThoiGianNhanWidgetState extends State<ThoiGianNhanWidget> {
  List<ThoiGianNhanHangModel> listThoigianNhanHang = [
    ThoiGianNhanHangModel(isactive: true, name: "Giao hàng giờ hành chính", desc: "Phù hợp văn phòng / cơ quan"),
    ThoiGianNhanHangModel(isactive: false, name: "Tất cả các ngày trong tuần", desc: "Phù hợp với nhà riêng"),
    ThoiGianNhanHangModel(isactive: false, name: "Giao hàng trong 2h", desc: "Áp dụng địa chỉ giao hàng tại Tp. Hồ Chí Minh"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listThoigianNhanHang
          .asMap()
          .entries
          .map((e) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      for (var v in listThoigianNhanHang) {
                        v.isactive = false;
                      }
                      listThoigianNhanHang[e.key].isactive = true;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Custom Radio btn
                      Container(
                        margin: const EdgeInsets.only(right: 9),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(color: e.value.isactive ? const Color(0xffFF7465) : Colors.transparent),
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                        ),
                        child: Icon(
                          Icons.circle,
                          color: e.value.isactive ? const Color(0xffFF7465) : const Color(0xffD9D9D9),
                          size: 12,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              e.value.name,
                              style: const TextStyle(fontSize: 13, color: Color(0xff171717)),
                            ),
                          ),
                          Text(
                            e.value.desc,
                            style: const TextStyle(fontSize: 10, color: Color(0xff7A7D8A)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
