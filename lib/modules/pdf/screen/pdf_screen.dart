import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../cart/provider/cart_controller.dart';
import '../provider/pdf_controller.dart';
import '../repository/pdf_repo.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({Key? key}) : super(key: key);

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  late TextEditingController _diachiCtrl;
  late TextEditingController _ghichuCtrl;
  late TextEditingController _fullnameCtrl;

  @override
  void initState() {
    super.initState();
    _diachiCtrl = TextEditingController();
    _ghichuCtrl = TextEditingController();
    _fullnameCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _diachiCtrl.dispose();
    _ghichuCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          return TextButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Stack(
                          children: <Widget>[
                            Positioned(
                              right: -40.0,
                              top: -40.0,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.close),
                                ),
                              ),
                            ),
                            Form(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        decoration: const InputDecoration(hintText: "Địa chỉ"),
                                        controller: _diachiCtrl,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        decoration: const InputDecoration(hintText: "Họ và tên"),
                                        controller: _fullnameCtrl,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        decoration: const InputDecoration(hintText: "Ghi chú"),
                                        controller: _ghichuCtrl,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        child: const Text("Submit"),
                                        onPressed: () async {
                                          context.pop();
                                          setState(() {});
                                          final pdfFile = await PdfController.generate(ref.watch(cartNotifierProvider).list, _fullnameCtrl.text, _diachiCtrl.text, _ghichuCtrl.text);
                                          PdfRepo.openFile(pdfFile);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: const Text("Tạo pdf"));
        }),
      ),
    );
  }
}
