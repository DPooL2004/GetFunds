import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:getfunds/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetFunds());
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
