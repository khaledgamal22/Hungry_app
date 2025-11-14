import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:hungry/features/login/data/models/login_request_model.dart';
import 'package:hungry/features/login/data/models/login_response_model.dart';
import 'package:hungry/features/login/data/repos/login_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginRepo loginRepo;

  void login() async {
    emit(LoginLoading());
    final loginRequestModel = LoginRequestModel(
      email: emailController.text,
      password: passwordController.text,
    );
    final result = await loginRepo.login(loginRequestModel: loginRequestModel);
    result.fold(
      (error) => emit(
        LoginFailure(errorMessage: error.message ?? "an error occurred"),
      ),
      (success) => emit(LoginSuccess(loginResponseModel: success)),
    );
  }
}
