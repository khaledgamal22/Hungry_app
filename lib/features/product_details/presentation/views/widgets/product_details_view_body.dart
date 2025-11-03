import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/helpers/extentions.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/add_to_cart_section.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/scrollable_list_details.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

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
        Gap(10),
        Expanded(child: ScrollableListDetails()),
        AddToCartSection(),
      ],
    );
  }
}
