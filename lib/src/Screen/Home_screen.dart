import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 80,
            width: double.infinity,
            child: Row(
              children: [
                Image.asset(
                  'assets/logos/logo.jpg',
                  fit: BoxFit.contain,
                ),
                Text(
                  'Star Computers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
