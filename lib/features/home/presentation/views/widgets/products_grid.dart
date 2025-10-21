import 'package:flutter/material.dart';
import 'package:hungry/core/helpers/extentions.dart';
import 'package:hungry/core/routes/routing.dart';
import 'package:hungry/features/home/presentation/views/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 185 / 225,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () => context.pushNamed(Routing.productDetails),
          child: ProductItem(),
        );
      },
      itemCount: 6,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
    );
  }
}
