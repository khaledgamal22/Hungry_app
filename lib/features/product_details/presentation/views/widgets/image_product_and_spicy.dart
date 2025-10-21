import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/core/utils/app_images.dart';

class ImageProductAndSpicy extends StatefulWidget {
  const ImageProductAndSpicy({super.key});

  @override
  State<ImageProductAndSpicy> createState() => _ImageProductAndSpicyState();
}

class _ImageProductAndSpicyState extends State<ImageProductAndSpicy> {
  double sliderValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        children: [
          Flexible(child: Image.asset(AppImages.productDetails)),
          Gap(30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Customize',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: AppColors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Your Burger to Your tasts, Ultimate Experience',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(20),
                Text(
                  'Spicy',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                Gap(10),
                Slider(
                  value: sliderValue,
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                  inactiveColor: Colors.grey,
                  activeColor: AppColors.primary,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      AnimatedScale(
                        scale: 1 + (1 - sliderValue) * 0.7,
                        duration: const Duration(milliseconds: 100),
                        child: Image.asset(AppImages.cold),
                      ),
                      Spacer(),
                      AnimatedScale(
                        scale: 1 + sliderValue * 0.7,
                        duration: const Duration(milliseconds: 100),
                        child: Image.asset(AppImages.hot),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
