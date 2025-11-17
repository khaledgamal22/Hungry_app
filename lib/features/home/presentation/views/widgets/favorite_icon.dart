import 'package:flutter/material.dart';
import 'package:hungry/core/services/get_it_service.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/home/presentation/view_models/home/home_cubit.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({
    super.key,
    required this.isFavoriteProduct,
    required this.productId,
  });
  final bool isFavoriteProduct;
  final int productId;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavoriteProduct = false;
  @override
  void initState() {
    isFavoriteProduct = widget.isFavoriteProduct;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = getIt<HomeCubit>();
    return GestureDetector(
      onTap: () {
        homeCubit.toggleFavoriteStatus(widget.productId);
        isFavoriteProduct = !isFavoriteProduct;
        setState(() {});
      },
      child: isFavoriteProduct
          ? Icon(Icons.favorite, color: AppColors.red)
          : Icon(Icons.favorite_border, color: AppColors.white),
    );
  }
}
