import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/profile/presentation/view_models/edit_profile/edit_profile_cubit.dart';

class PickImage extends StatelessWidget {
  const PickImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<EditProfileCubit>().pickProfileImage(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage:
                context.watch<EditProfileCubit>().profileImage != null
                ? FileImage(
                    File(context.read<EditProfileCubit>().profileImage!.path),
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
