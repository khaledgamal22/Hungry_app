import 'package:flutter/material.dart';
import 'package:hungry/core/utils/app_colors.dart';

class CircleIndicator extends StatelessWidget {
  const CircleIndicator({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          width: 20,
          height: 20,
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: isSelected ? Color(0xff3C2F2F) : Color(0xffF3F4F6),
          ),
          child: isSelected
              ? Padding(
                  padding: const EdgeInsets.all(3),
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: AppColors.white,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
