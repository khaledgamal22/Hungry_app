import 'package:flutter/material.dart';
import 'package:hungry/features/cart/data/models/cart_item_model.dart';
import 'package:hungry/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartProductsLoadingIndicator extends StatelessWidget {
  const CartProductsLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(),
      child: ListView.builder(
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: CartItem(
            cartItemModel: CartItemModel(
              productId: 0,
              itemId: 0,
              quantity: 0,
              name: "name",
              image:
                  "https://sonic-zdi0.onrender.com/storage/products/cheeseburger.jpg",
              price: "price",
              toppings: [],
              sideOptions: [],
              spicy: "",
            ),
          ),
        ),
        shrinkWrap: true,
        itemCount: 6,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
