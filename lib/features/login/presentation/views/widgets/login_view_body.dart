import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/login/presentation/views/widgets/dont_have_account.dart';
import 'package:hungry/features/login/presentation/views/widgets/login_button_bloc_consumer.dart';
import 'package:hungry/features/login/presentation/views/widgets/login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(50),
            LoginForm(),
            Gap(15),
            Text(
              'Forget Password?',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
              ),
            ),
            Gap(50),
            LoginButtonBlocConsumer(),
            Gap(15),
            DontHaveAccount(),
          ],
        ),
      ),
    );
  }
}
