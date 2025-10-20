import 'package:flutter/material.dart';
import 'package:hungry/features/cart/presentation/views/widgets/cart_item.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: CartItem(),
        ),
        shrinkWrap: true,
        itemCount: 6,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
