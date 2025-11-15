import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:hungry/features/profile/data/models/user_profile_model.dart';
import 'package:hungry/features/profile/data/repos/get_user_profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.getUserProfileRepo) : super(ProfileInitial());

  final GetUserProfileRepo getUserProfileRepo;

  void getUserProfile() async {
    emit(ProfileLoading());
    final result = await getUserProfileRepo.getUserProfile();
    result.fold(
      (failure) => emit(
        ProfileFailure(errorMessage: failure.message ?? "An error occurred"),
      ),
      (userProfile) {
        emit(ProfileSuccess(userProfileModel: userProfile));
      },
    );
  }
}
