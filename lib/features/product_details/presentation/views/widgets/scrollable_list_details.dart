import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/home/data/models/product_model.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/image_product_and_spicy.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/side_options_list.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/topping_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ScrollableListDetails extends StatelessWidget {
  const ScrollableListDetails({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ImageProductAndSpicy(productModel: productModel),
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
              Skeleton.shade(child: ToppingList()),
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
              Skeleton.shade(child: SideOptionsList()),
              Gap(20),
            ],
          ),
        ),
      ],
    );
  }
}
