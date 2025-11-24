import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/cart/data/models/cart_item_model.dart';
import 'package:hungry/features/cart/presentation/view_models/cart/cart_cubit.dart';
import 'package:hungry/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartList extends StatelessWidget {
  const CartList({super.key, required this.cartProducts});
  final List<CartItemModel> cartProducts;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: CartItem(cartItemModel: cartProducts[index]),
            ),
            shrinkWrap: true,
            itemCount: cartProducts.length,
            physics: const BouncingScrollPhysics(),
          ),
        );
      },
    );
  }
}
