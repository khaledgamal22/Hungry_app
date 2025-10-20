import 'package:flutter/material.dart';
import 'package:hungry/core/utils/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        cursorColor: AppColors.primary,
        cursorHeight: 22,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: AppColors.white,
          prefixIcon: Icon(Icons.search, color: AppColors.primary, size: 30),
          enabledBorder: buildTextborder(),
          focusedBorder: buildTextborder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildTextborder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.transparent, width: 1),
    );
  }
}
