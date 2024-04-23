import 'package:flutter/material.dart';

void main() {
  runApp(const GetFunds());
}

class GetFunds extends StatelessWidget {
  const GetFunds({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(),
      ),
    );
  }
}
