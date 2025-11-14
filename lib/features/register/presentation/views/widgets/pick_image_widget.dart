import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/register/presentation/view_models/register/register_cubit.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<RegisterCubit>().pickProfileImage(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 35.r,
            backgroundImage: context.watch<RegisterCubit>().profileImage != null
                ? FileImage(
                    File(context.read<RegisterCubit>().profileImage!.path),
                  )
                : null,
            backgroundColor: Colors.grey[200],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Icon(Icons.camera_alt, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
