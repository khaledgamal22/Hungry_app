import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';

class SuccesDialog extends StatelessWidget {
  const SuccesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: AppColors.primary,
              ),
              child: Icon(Icons.check, color: AppColors.white, size: 50),
            ),
            Gap(30),
            Text(
              'Success !',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            Gap(15),
            Text(
              'Your payment was successful.A receipt for this purchase has been sent to your email.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffBCBBBB),
              ),
            ),
            Gap(50),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: const Text(
                    'Go Back',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
            Gap(15),
          ],
        ),
      ),
    );
  }
}
