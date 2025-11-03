import 'package:flutter/material.dart';
import 'package:hungry/features/checkout/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CheckoutViewBody());
  }
}
