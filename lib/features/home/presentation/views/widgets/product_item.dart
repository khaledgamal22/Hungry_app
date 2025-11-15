import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/home/data/models/product_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        gradient: LinearGradient(
          colors: [AppColors.white, AppColors.primary],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.4, 1],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Skeleton.ignore(
                child: Center(child: Image.network(productModel.image)),
              ),
            ),
            Gap(5),
            Text(
              productModel.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Gap(5),
                Text(
                  productModel.rating,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                Spacer(),
                Icon(Icons.favorite_border, color: AppColors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
