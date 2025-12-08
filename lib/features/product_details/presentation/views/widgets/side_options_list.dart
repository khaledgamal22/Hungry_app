import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/product_details/presentation/view_models/product_details/product_details_cubit.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/side_option_card.dart';

class SideOptionsList extends StatelessWidget {
  const SideOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsCubit>();
    return SizedBox(
      height: 150,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return SideOptionCard(toppingModel: cubit.sideOptionsList[index]);
        },
        separatorBuilder: (context, index) => Gap(20),
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
