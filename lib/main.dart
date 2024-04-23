import 'package:flutter/material.dart';
import 'package:getfunds/splash.dart';

void main() {
  runApp(const GetFunds());
}

class GetFunds extends StatelessWidget {
  const GetFunds({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Splash(),
      ),
    );
  }
}
