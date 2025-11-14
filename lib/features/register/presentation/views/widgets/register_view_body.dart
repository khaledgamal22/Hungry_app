import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/register/presentation/views/widgets/already_have_account.dart';
import 'package:hungry/features/register/presentation/views/widgets/register_button_bloc_consumer.dart';
import 'package:hungry/features/register/presentation/views/widgets/register_form.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(50),
            RegisterForm(),
            Gap(50),
            RegisterButtonBlocConsumer(),
            Gap(15),
            AlreadyHaveAccount(),
          ],
        ),
      ),
    );
  }
}
