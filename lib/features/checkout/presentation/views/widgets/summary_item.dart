import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.title, required this.amount});
  final String title;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color(0xff7D7D7D),
          ),
        ),
        Spacer(),
        Text(
          '\$$amount',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color(0xff7D7D7D),
          ),
        ),
      ],
    );
  }
}
