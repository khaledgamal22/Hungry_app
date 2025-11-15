import 'package:flutter/material.dart';
import 'package:hungry/core/database/cache/cache_helper.dart';
import 'package:hungry/core/database/cache/cache_keys.dart';
import 'package:hungry/core/services/get_it_service.dart';
import 'package:hungry/core/utils/app_colors.dart';

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
              'Hello, ${getIt<CacheHelper>().getString(key: CacheKeys.name)}',
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
              image: NetworkImage(
                getIt<CacheHelper>().getString(key: CacheKeys.profileImage)!,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
