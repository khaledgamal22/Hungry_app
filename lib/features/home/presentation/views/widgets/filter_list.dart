import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/home/presentation/view_models/home/home_cubit.dart';
import 'package:hungry/features/home/presentation/views/widgets/filter_item.dart';
import 'package:hungry/features/home/presentation/views/widgets/filter_loading_indicator_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FilterList extends StatelessWidget {
  const FilterList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (_, current) =>
          current is GetCategoriesLoading ||
          current is GetCategoriesSuccess ||
          current is GetCategoriesFailure,
      builder: (context, state) {
        if (state is GetCategoriesSuccess) {
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
                    title: cubit.categories[index].name,
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return Gap(10);
              },
              itemCount: cubit.categories.length,
            ),
          );
        } else if (state is GetCategoriesFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return FilterLoadingIndicatorList();
        }
      },
    );
  }
}
