import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/features/profile/data/models/user_profile_model.dart';

abstract class GetUserProfileRepo {
  Future<Either<ApiErrorModel, UserProfileModel>> getUserProfile();
}
