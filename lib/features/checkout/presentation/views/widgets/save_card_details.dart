import 'package:flutter/material.dart';
import 'package:hungry/core/utils/app_colors.dart';

class SaveCardDetails extends StatefulWidget {
  const SaveCardDetails({super.key});

  @override
  State<SaveCardDetails> createState() => _SaveCardDetailsState();
}

class _SaveCardDetailsState extends State<SaveCardDetails> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          activeColor: AppColors.primary,
          side: BorderSide(color: AppColors.primary),
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text(
          'Save card details for future payments',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff808080),
          ),
        ),
      ],
    );
  }
}
