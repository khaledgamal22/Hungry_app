import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/home/presentation/views/widgets/filter_list.dart';
import 'package:hungry/features/home/presentation/views/widgets/home_header.dart';
import 'package:hungry/features/home/presentation/views/widgets/products_grid.dart';
import 'package:hungry/features/home/presentation/views/widgets/search_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Gap(30),
          HomeHeader(),
          Gap(20),
          SearchTextField(),
          Gap(16),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [FilterList(), Gap(20), ProductsGrid(), Gap(30)],
            ),
          ),
        ],
      ),
    );
  }
}
