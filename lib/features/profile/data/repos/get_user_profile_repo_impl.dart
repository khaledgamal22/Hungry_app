import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_consumer.dart';
import 'package:hungry/core/database/api/api_error_handler.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/core/database/api/end_points.dart';
import 'package:hungry/features/profile/data/models/user_profile_model.dart';
import 'package:hungry/features/profile/data/repos/get_user_profile_repo.dart';

class GetUserProfileRepoImpl implements GetUserProfileRepo {
  final ApiConsumer apiConsumer;
  GetUserProfileRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, UserProfileModel>> getUserProfile() async {
    try {
      final response = await apiConsumer.get(EndPoints.getUserProfile);
      final userProfile = UserProfileModel.fromJson(response.data['data']);
      return Right(userProfile);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
