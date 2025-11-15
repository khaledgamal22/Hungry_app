import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  XFile? profileImage;

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
