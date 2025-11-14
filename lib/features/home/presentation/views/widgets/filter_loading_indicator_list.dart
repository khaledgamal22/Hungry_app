import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/home/presentation/views/widgets/filter_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FilterLoadingIndicatorList extends StatelessWidget {
  const FilterLoadingIndicatorList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Skeletonizer(
        effect: ShimmerEffect(),
        enabled: true,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return FilterItem(isSelected: false, title: 'Category');
          },
          separatorBuilder: (_, index) {
            return Gap(10);
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
