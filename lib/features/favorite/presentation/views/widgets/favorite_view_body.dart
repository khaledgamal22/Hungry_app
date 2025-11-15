import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/helpers/extentions.dart';
import 'package:hungry/core/routes/routing.dart';
import 'package:hungry/features/favorite/presentation/view_models/favorite/favorite_cubit.dart';
import 'package:hungry/features/home/presentation/views/widgets/product_item.dart';
import 'package:hungry/features/home/presentation/views/widgets/products_loading_indicator_grid.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteSuccess) {
          return Padding(
            padding: const EdgeInsets.only(top: 30, left: 12, right: 12),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 185 / 225,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () => context.pushNamed(
                    Routing.productDetails,
                    argument: state.favoriteProducts[index].id,
                  ),
                  child: ProductItem(
                    productModel: state.favoriteProducts[index],
                  ),
                );
              },
              itemCount: state.favoriteProducts.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
            ),
          );
        } else if (state is FavoriteFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return ProductsLoadingIndicatorGrid();
        }
      },
    );
  }
}
