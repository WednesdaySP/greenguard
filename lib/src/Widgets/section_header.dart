import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
