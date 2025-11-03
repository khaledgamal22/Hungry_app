import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/checkout/presentation/views/widgets/success_dialog.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(5),
                Text(
                  '\$10.00',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              height: 60,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  showDialog(context: context, builder: (_) => SuccesDialog());
                },
                child: const Text(
                  'Pay Now',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
