import 'package:flutter/material.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/favorite/presentation/views/widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      body: FavoriteViewBody(),
    );
  }
}
