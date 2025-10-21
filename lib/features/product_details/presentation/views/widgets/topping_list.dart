import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_images.dart';
import 'package:hungry/features/product_details/data/models/topping_model.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/topping_card.dart';

class ToppingList extends StatelessWidget {
  const ToppingList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ToppingModel> toppings = [
      ToppingModel(name: 'Tomato', image: AppImages.tomato),
      ToppingModel(name: 'Onions', image: AppImages.onion),
      ToppingModel(name: 'Pickles', image: AppImages.pickels),
      ToppingModel(name: 'Bacons', image: AppImages.bacons),
    ];
    return SizedBox(
      height: 150,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ToppingCard(toppingModel: toppings[index]);
        },
        separatorBuilder: (context, index) => Gap(20),
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
