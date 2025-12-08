import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/core/widgets/toast.dart';
import 'package:hungry/features/product_details/presentation/view_models/product_details/product_details_cubit.dart';

class AddToCartSection extends StatelessWidget {
  const AddToCartSection({super.key, required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(5),
                Text(
                  '\$$price',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Spacer(),
            BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
              listener: (context, state) {
                if (state is AddToCartSuccess) {
                  successToast(message: state.message);
                }
                if (state is AddToCartFailure) {
                  errorToast(message: state.errorMessage);
                }
              },
              builder: (context, state) {
                return state is AddToCartLoading
                    ? const CircularProgressIndicator(color: AppColors.primary)
                    : SizedBox(
                        height: 60,
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            final cubit = context.read<ProductDetailsCubit>();
                            cubit.updateAddToCartModel();
                            cubit.addToCart();
                          },
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
