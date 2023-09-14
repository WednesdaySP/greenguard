import 'package:flutter/material.dart';
import 'package:greenguard/src/Screen/Home_screen.dart';
import 'package:greenguard/src/Screen/Seller_secreen1.dart';
import 'package:greenguard/src/Screen/prd_des.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'templet',
      home: SellerPage(),
    );
  }
}
