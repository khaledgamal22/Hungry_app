import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/product_details/presentation/view_models/product_details/product_details_cubit.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/topping_card.dart';

class ToppingList extends StatelessWidget {
  const ToppingList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsCubit>();
    return SizedBox(
      height: 150,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ToppingCard(toppingModel: cubit.toppingsList[index]);
        },
        separatorBuilder: (context, index) => Gap(20),
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
