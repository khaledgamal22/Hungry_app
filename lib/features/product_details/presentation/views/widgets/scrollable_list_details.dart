import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/image_product_and_spicy.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/side_options_list.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/topping_list.dart';

class ScrollableListDetails extends StatelessWidget {
  const ScrollableListDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ImageProductAndSpicy(),
        Gap(20),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Toppings',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(20),
              ToppingList(),
              Gap(30),
              Text(
                'Side options',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(20),
              SideOptionsList(),
              Gap(20),
            ],
          ),
        ),
      ],
    );
  }
}
