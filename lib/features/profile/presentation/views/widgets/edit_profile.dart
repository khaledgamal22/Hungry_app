import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/core/widgets/custom_text_field.dart';
import 'package:hungry/features/profile/presentation/views/widgets/pick_image.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buildEditDialog(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Edit Profile', style: TextStyle(fontSize: 14)),
          Gap(10),
          Icon(Icons.edit, color: AppColors.primary),
        ],
      ),
    );
  }

  Future<dynamic> buildEditDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PickImage(),
              CustomTextFormField(
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
                hintText: 'name',
                labelText: 'name',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
