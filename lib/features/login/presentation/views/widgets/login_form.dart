import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/widgets/custom_text_field.dart';
import 'package:hungry/features/login/presentation/view_models/login/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
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
          Gap(25),
          CustomTextFormField(
            labelText: 'Password',
            controller: cubit.passwordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: ' Enter your password',
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
