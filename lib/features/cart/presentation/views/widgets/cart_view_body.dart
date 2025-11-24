import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/cart/presentation/view_models/cart/cart_cubit.dart';
import 'package:hungry/features/cart/presentation/views/widgets/cart_list.dart';
import 'package:hungry/features/cart/presentation/views/widgets/cart_products_loading_indicator.dart';
import 'package:hungry/features/cart/presentation/views/widgets/cart_summary.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetCartProductsSuccess) {
          return Column(
            children: [
              Gap(30),
              CartList(cartProducts: state.cartResponse.items),
              CartSummary(price: state.cartResponse.totalPrice),
              Gap(50),
            ],
          );
        } else if (state is GetCartProductsFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return CartProductsLoadingIndicator();
        }
      },
    );
  }
}
