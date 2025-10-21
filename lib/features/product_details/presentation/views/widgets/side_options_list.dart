import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_images.dart';
import 'package:hungry/features/product_details/data/models/topping_model.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/topping_card.dart';

class SideOptionsList extends StatelessWidget {
  const SideOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ToppingModel> sideOptions = [
      ToppingModel(name: 'Fries', image: AppImages.fries),
      ToppingModel(name: 'Coleslaw', image: AppImages.coleslaw),
      ToppingModel(name: 'Salad', image: AppImages.salad),
      ToppingModel(name: 'Onion', image: AppImages.friesOnion),
    ];
    return SizedBox(
      height: 150,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ToppingCard(toppingModel: sideOptions[index]);
        },
        separatorBuilder: (context, index) => Gap(20),
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
