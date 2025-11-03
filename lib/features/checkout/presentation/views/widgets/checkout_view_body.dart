import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/helpers/extentions.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/checkout/presentation/views/widgets/order_summary.dart';
import 'package:hungry/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:hungry/features/checkout/presentation/views/widgets/payment_summary.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(50),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Icon(Icons.arrow_back, color: AppColors.black),
          ),
        ),
        Gap(20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [OrderSummary(), Gap(60), PaymentSection()],
            ),
          ),
        ),
        PaymentSummary(),
      ],
    );
  }
}
