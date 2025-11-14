import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/widgets/custom_text_field.dart';
import 'package:hungry/features/register/presentation/view_models/register/register_cubit.dart';
import 'package:hungry/features/register/presentation/views/widgets/pick_image_widget.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          PickImageWidget(),
          Gap(25),
          CustomTextFormField(
            labelText: 'Name',
            controller: cubit.nameController,
            keyboardType: TextInputType.text,
            hintText: 'Enter your name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'field required';
              }
              return null;
            },
          ),
          Gap(15),
          CustomTextFormField(
            labelText: 'phone',
            controller: cubit.phoneController,
            keyboardType: TextInputType.phone,
            hintText: 'Enter your phone',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'field required';
              }
              return null;
            },
          ),
          Gap(15),
          CustomTextFormField(
            labelText: 'Email',
            controller: cubit.emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Enter your email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'field required';
              }
              return null;
            },
          ),
          Gap(15),
          CustomTextFormField(
            labelText: 'Password',
            controller: cubit.passwordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'Enter your password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'field required';
              }
              return null;
            },
            isPasswordfield: true,
          ),
        ],
      ),
    );
  }
}
