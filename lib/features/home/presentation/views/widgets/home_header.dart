import 'package:flutter/material.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/core/utils/app_images.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'HUNGRY?',
              style: const TextStyle(
                fontSize: 50,
                color: AppColors.primary,
                fontWeight: FontWeight.w400,
                fontFamily: 'Luckiest Guy',
              ),
            ),
            Text(
              'Hello, Rich Sonic',
              style: TextStyle(color: Color(0xff6A6A6A), fontSize: 18),
            ),
          ],
        ),
        Spacer(),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(AppImages.profilePicture),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
