import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.validator,
    required this.keyboardType,
    required this.hintText,
    this.hintTextStyle,
    this.maxLines,
    this.isPasswordfield,
    this.suffixIcon,
    required this.labelText,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String hintText;
  final String labelText;
  final TextStyle? hintTextStyle;
  final int? maxLines;
  final bool? isPasswordfield;
  final Widget? suffixIcon;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Gap(8),
        Container(
          height: widget.maxLines != null ? widget.maxLines! * 24.h : 70.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0.r),
          ),
          child: TextFormField(
            obscureText: widget.isPasswordfield == true ? isSecure : false,
            cursorColor: AppColors.primary,
            controller: widget.controller,
            maxLines: widget.maxLines ?? 1,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              hintText: widget.hintText,

              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              hintStyle:
                  widget.hintTextStyle ??
                  const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSecure = !isSecure;
                    });
                  },
                  child: widget.isPasswordfield == true
                      ? Icon(
                          isSecure ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        )
                      : widget.suffixIcon ?? SizedBox(),
                ),
              ),
              border: borderDecoration(),
              focusedBorder: borderDecoration(color: AppColors.primary),
              enabledBorder: borderDecoration(),
              errorBorder: borderDecoration(color: AppColors.red),
              focusedErrorBorder: borderDecoration(color: AppColors.red),
            ),
            keyboardType: widget.keyboardType,
            validator: widget.validator,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder borderDecoration({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: color ?? AppColors.borderColor, width: 1.0),
    );
  }
}
