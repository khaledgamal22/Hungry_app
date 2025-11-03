import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
    required this.child,
    required this.isSelected,
  });
  final Widget child;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? Color(0xff3C2F2F) : Color(0xffF3F4F6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: child,
      ),
    );
  }
}
