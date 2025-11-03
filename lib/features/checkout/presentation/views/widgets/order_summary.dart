import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/checkout/presentation/views/widgets/summary_item.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Summary',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Gap(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SummaryItem(title: 'Order', amount: 16.48),
              Gap(15),
              SummaryItem(title: 'Taxes', amount: 0.3),
              Gap(15),
              SummaryItem(title: 'Delivery fees', amount: 1.5),
              Divider(color: Color(0xffF0F0F0), height: 20),
              Gap(15),
              Row(
                children: [
                  Text(
                    'Total: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Text(
                    '\$10.00',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Gap(15),
              Row(
                children: [
                  Text(
                    'Estimated delivery time:',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Text(
                    '15 ~ 30 mins',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
