import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/product_details/data/models/topping_model.dart';

class ToppingCard extends StatelessWidget {
  const ToppingCard({super.key, required this.toppingModel});

  final ToppingModel toppingModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      decoration: BoxDecoration(
        color: Color(0xff3C2F2F),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withValues(alpha: 0.25),
            blurRadius: 4,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.asset(toppingModel.image, height: 60),
                  ),
                ),
              ),
            ],
          ),
          Gap(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  toppingModel.name,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(5),
                Spacer(),
                Icon(Icons.add_circle, color: AppColors.white, size: 24),
              ],
            ),
          ),
          Gap(10),
        ],
      ),
    );
  }
}
