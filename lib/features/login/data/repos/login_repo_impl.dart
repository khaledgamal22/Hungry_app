import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_consumer.dart';
import 'package:hungry/core/database/api/api_error_handler.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/core/database/api/end_points.dart';
import 'package:hungry/core/database/cache/cache_helper.dart';
import 'package:hungry/core/database/cache/cache_keys.dart';
import 'package:hungry/core/database/cache/secure_storage.dart';
import 'package:hungry/core/services/get_it_service.dart';
import 'package:hungry/features/login/data/models/login_request_model.dart';
import 'package:hungry/features/login/data/models/login_response_model.dart';
import 'package:hungry/features/login/data/repos/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiConsumer apiConsumer;

  LoginRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, LoginResponseModel>> login({
    required LoginRequestModel loginRequestModel,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.login,
        data: loginRequestModel.toMap(),
      );
      final LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
        response.data,
      );
      await saveUserData(loginResponseModel);
      return Right(loginResponseModel);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }

  Future<void> saveUserData(LoginResponseModel loginResponseModel) async {
    await SecureStorage.instance.addData(
      key: CacheKeys.token,
      value: loginResponseModel.token,
    );
    await getIt<CacheHelper>().saveData(
      key: CacheKeys.email,
      value: loginResponseModel.email,
    );
    await getIt<CacheHelper>().saveData(
      key: CacheKeys.name,
      value: loginResponseModel.name,
    );
    await getIt<CacheHelper>().saveData(
      key: CacheKeys.profileImage,
      value: loginResponseModel.image,
    );
  }
}
