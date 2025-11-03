import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/core/utils/app_images.dart';
import 'package:hungry/features/checkout/presentation/views/widgets/circle_indicator.dart';
import 'package:hungry/features/checkout/presentation/views/widgets/payment_method.dart';
import 'package:hungry/features/checkout/presentation/views/widgets/save_card_details.dart';

class PaymentSection extends StatefulWidget {
  const PaymentSection({super.key});

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  PaymentMethodType paymentMethodType = PaymentMethodType.cash;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Methods',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Gap(20),
        GestureDetector(
          onTap: () {
            setState(() {
              paymentMethodType = PaymentMethodType.cash;
            });
          },
          child: PaymentMethod(
            isSelected: paymentMethodType == PaymentMethodType.cash,
            child: Row(
              children: [
                Image.asset(AppImages.dollar, width: 83, height: 60),
                Gap(10),
                Text(
                  'Cash on Delivery',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: paymentMethodType == PaymentMethodType.cash
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
                Spacer(),
                CircleIndicator(
                  isSelected: paymentMethodType == PaymentMethodType.cash,
                ),
              ],
            ),
          ),
        ),
        Gap(20),
        GestureDetector(
          onTap: () {
            setState(() {
              paymentMethodType = PaymentMethodType.card;
            });
          },
          child: PaymentMethod(
            isSelected: paymentMethodType == PaymentMethodType.card,
            child: Row(
              children: [
                Image.asset(AppImages.visa, width: 83, height: 60),
                Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Debit card',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: paymentMethodType == PaymentMethodType.card
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                    Text(
                      '3566 **** **** 0505',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: paymentMethodType == PaymentMethodType.card
                            ? AppColors.white
                            : Color(0xff808080),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CircleIndicator(
                  isSelected: paymentMethodType == PaymentMethodType.card,
                ),
              ],
            ),
          ),
        ),
        SaveCardDetails(),
      ],
    );
  }
}

enum PaymentMethodType { cash, card }
