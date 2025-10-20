import 'package:flutter/material.dart';
import 'package:hungry/core/utils/app_colors.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({super.key, required this.title, required this.isSelected});
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Color(0xffF3F4F6),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Center(
          child: Text(
            title,
            style: isSelected
                ? TextStyle(color: AppColors.white, fontSize: 16)
                : TextStyle(color: Color(0xff6A6A6A), fontSize: 16),
          ),
        ),
      ),
    );
  }
}
