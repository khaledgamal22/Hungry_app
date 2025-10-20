import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/home/presentation/view_models/home/home_cubit.dart';
import 'package:hungry/features/home/presentation/views/widgets/filter_item.dart';

class FilterList extends StatelessWidget {
  const FilterList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeCubit>();
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              cubit.changeFilter(index);
            },
            child: FilterItem(
              isSelected: index == cubit.selectedIndex,
              title: cubit.filters[index],
            ),
          );
        },
        separatorBuilder: (_, index) {
          return Gap(10);
        },
        itemCount: cubit.filters.length,
      ),
    );
  }
}
