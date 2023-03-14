import 'dart:io';
import 'package:larosas/modules/pdf/repository/pdf_repo.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import '../../cart/model/cart_model.dart';

class PdfController {
  static Future<File> generate(List<CartModel> model, String name, String address, String note) async {
    final pdf = Document();
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildPdfUserInfo(name, address, note, font),
        buildInvoice(model, font),
        Divider(),
      ],
    ));

    return PdfRepo.saveDocument(name: 'my_cart_info.pdf', pdf: pdf);
  }

  static Widget buildPdfUserInfo(String name, String address, String note, Font font) {
    // return Column(children: [
    //   Row(children: [
    //     Padding(padding: const EdgeInsets.only(right: 20), child: Text('Họ và tên:', style: TextStyle(font: font))),
    //     Text(name, style: TextStyle(font: font))
    //   ]),
    //   Row(children: [
    //     Padding(padding: const EdgeInsets.only(right: 20), child: Text('Địa chỉ:', style: TextStyle(font: font))),
    //     Text(address, style: TextStyle(font: font))
    //   ]),
    //   Row(children: [
    //     Padding(padding: const EdgeInsets.only(right: 20), child: Text('Ghi chú:', style: TextStyle(font: font))),
    //     Text(note, style: TextStyle(font: font))
    //   ]),
    //   SizedBox(height: 20),
    // ]);
    return Table(
        border: const TableBorder(
          horizontalInside: BorderSide(width: 0),
          verticalInside: BorderSide(width: 0),
          left: BorderSide(width: 0),
          right: BorderSide(width: 0),
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        tableWidth: TableWidth.max,
        children: [
          TableRow(children: [
            Column(children: [
              Text("Họ và tên", style: TextStyle(font: font)),
              Text(name, style: TextStyle(font: font))
            ]),
            Column(children: [
              Text("Địa chỉ", style: TextStyle(font: font)),
              Text(address, style: TextStyle(font: font))
            ]),
            Column(children: [
              Text("Ghi chú", style: TextStyle(font: font)),
              Text(note, style: TextStyle(font: font))
            ]),
          ])
        ]);
  }

  static Widget buildInvoice(List<CartModel> model, Font font) {
    final headers = [
      'Name',
      'Price',
      'Số lượng',
      'Total',
    ];
    final data = model.map((item) {
      final total = item.price * item.qty;

      return [
        item.name,
        item.price,
        '${item.qty}',
        (total.toString()),
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(font: font),
      headerDecoration: const BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellStyle: TextStyle(font: font),
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.center,
        2: Alignment.center,
        3: Alignment.center,
        4: Alignment.center,
        5: Alignment.center,
      },
    );
  }
}
