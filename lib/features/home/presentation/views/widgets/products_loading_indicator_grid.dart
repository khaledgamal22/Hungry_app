import 'package:flutter/material.dart';
import 'package:hungry/core/helpers/extentions.dart';
import 'package:hungry/core/routes/routing.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/home/data/models/product_model.dart';
import 'package:hungry/features/home/presentation/views/widgets/product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsLoadingIndicatorGrid extends StatelessWidget {
  const ProductsLoadingIndicatorGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        highlightColor: AppColors.primary.withValues(alpha: 0.2),
      ),
      enabled: true,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 185 / 225,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () => context.pushNamed(Routing.productDetails),
            child: ProductItem(
              productModel: ProductModel(
                id: 0,
                name: '',
                description: '',
                price: '0',
                image:
                    'https://sonic-zdi0.onrender.com/storage/products/veggie.jpg',
                rating: "0",
              ),
            ),
          );
        },
        itemCount: 6,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
