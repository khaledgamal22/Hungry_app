import 'package:flutter/material.dart';
import 'package:hungry/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: CartViewBody()));
  }
}
