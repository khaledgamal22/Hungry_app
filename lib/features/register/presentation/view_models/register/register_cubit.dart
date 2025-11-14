import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hungry/features/register/data/models/register_request_model.dart';
import 'package:hungry/features/register/data/repos/register_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  XFile? profileImage;

  final RegisterRepo registerRepo;

  void register() async {
    emit(RegisterLoading());
    final registerRequestModel = RegisterRequestModel(
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
      password: passwordController.text,
      profileImagePath: profileImage,
    );
    final result = await registerRepo.register(
      registerRequestModel: registerRequestModel,
    );
    result.fold(
      (error) => emit(
        RegisterFailure(errorMessage: error.message ?? "an error occurred"),
      ),
      (success) => emit(RegisterSuccess(message: success.message)),
    );
  }

  Future<void> pickProfileImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      profileImage = await picker.pickImage(source: ImageSource.gallery);
      if (profileImage != null) {
        emit(ProfileImagePickedSuccessfully());
      } else {
        emit(ProfileImagePickedFailed());
      }
    } catch (_) {
      emit(ProfileImagePickedFailed());
    }
  }
}
