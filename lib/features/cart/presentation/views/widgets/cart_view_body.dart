import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/cart/presentation/views/widgets/cart_list.dart';
import 'package:hungry/features/cart/presentation/views/widgets/cart_summary.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Gap(30), CartList(), CartSummary()]);
  }
}
