import 'package:flutter/material.dart';
import 'widget/forget_code_widget.dart';

class ForgetCodeScreen extends StatefulWidget {
  const ForgetCodeScreen({super.key});

  @override
  State<ForgetCodeScreen> createState() => ForgetCodeScreenState();
}

class ForgetCodeScreenState extends State<ForgetCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ForgetCodeWidget(),
    );
  }
}
