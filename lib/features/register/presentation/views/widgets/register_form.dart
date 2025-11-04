import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/widgets/custom_text_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            labelText: 'Name',
            controller: TextEditingController(),
            keyboardType: TextInputType.text,
            hintText: 'Enter your name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'field required';
              }
              return null;
            },
          ),
          Gap(25),
          CustomTextFormField(
            labelText: 'Email',
            controller: TextEditingController(),
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
            controller: TextEditingController(),
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
