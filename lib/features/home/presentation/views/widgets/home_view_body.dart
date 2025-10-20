import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/core/utils/app_images.dart';
import 'package:hungry/features/home/presentation/views/widgets/filter_list.dart';
import 'package:hungry/features/home/presentation/views/widgets/home_header.dart';
import 'package:hungry/features/home/presentation/views/widgets/search_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Gap(50),
          HomeHeader(),
          Gap(20),
          SearchTextField(),
          Gap(30),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [FilterList(), Gap(30), ProductsGrid(), Gap(30)],
            ),
          ),
        ],
      ),
    );
  }
}

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
        return ProductItem();
      },
      itemCount: 6,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
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
            Flexible(child: Center(child: Image.asset(AppImages.pngwing))),
            Gap(5),
            Text(
              'Cheeseburger',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              "Wendy's Burger",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Gap(5),
                Text(
                  '4.5',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Icon(Icons.favorite_border, color: AppColors.primary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
