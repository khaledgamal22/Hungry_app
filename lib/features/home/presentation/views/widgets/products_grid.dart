import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/helpers/extentions.dart';
import 'package:hungry/core/routes/routing.dart';
import 'package:hungry/features/home/presentation/view_models/home/home_cubit.dart';
import 'package:hungry/features/home/presentation/views/widgets/product_item.dart';
import 'package:hungry/features/home/presentation/views/widgets/products_loading_indicator_grid.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetProductsLoading ||
          current is GetProductsSuccess ||
          current is GetProductsFailure,
      builder: (context, state) {
        if (state is GetProductsSuccess) {
          if (state.productsList.isEmpty) {
            return Center(child: Text('No products found'));
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 185 / 225,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () => context.pushNamed(Routing.productDetails),
                child: ProductItem(productModel: state.productsList[index]),
              );
            },
            itemCount: state.productsList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
          );
        } else if (state is GetProductsFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return ProductsLoadingIndicatorGrid();
        }
      },
    );
  }
}
