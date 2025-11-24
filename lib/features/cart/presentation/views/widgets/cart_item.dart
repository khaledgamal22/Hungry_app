import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/cart/data/models/cart_item_model.dart';
import 'package:hungry/features/cart/presentation/views/widgets/update_cart_product.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(cartItemModel.image, height: 100, width: 100),
                  Gap(5),
                  Text(
                    cartItemModel.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  // Text(
                  //   "Wendy's Burger",
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w400,
                  //     color: AppColors.black,
                  //   ),
                  // ),
                ],
              ),
            ),
            Spacer(),
            UpdateCartProduct(productQuantity: cartItemModel.quantity),
          ],
        ),
      ),
    );
  }
}
