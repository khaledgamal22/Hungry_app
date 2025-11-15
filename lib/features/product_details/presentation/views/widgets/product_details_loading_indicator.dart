import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/helpers/extentions.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/home/data/models/product_model.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/scrollable_list_details.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetailsLoadingIndicator extends StatelessWidget {
  const ProductDetailsLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(),
      enabled: true,
      child: Column(
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
          Expanded(
            child: ScrollableListDetails(
              productModel: ProductModel(
                id: 0,
                name: '',
                description: '',
                price: '',
                image: '',
                rating: '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
