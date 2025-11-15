import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/helpers/extentions.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/product_details/presentation/view_models/product_details/product_details_cubit.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/add_to_cart_section.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/product_details_loading_indicator.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/scrollable_list_details.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(50),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: Icon(Icons.arrow_back, color: AppColors.black),
                ),
              ),
              Gap(10),
              Expanded(
                child: ScrollableListDetails(productModel: state.productModel),
              ),
              AddToCartSection(price: state.productModel.price),
            ],
          );
        } else if (state is ProductDetailsFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return ProductDetailsLoadingIndicator();
        }
      },
    );
  }
}
