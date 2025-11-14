import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/features/login/data/models/login_request_model.dart';
import 'package:hungry/features/login/data/models/login_response_model.dart';

abstract class LoginRepo {
  Future<Either<ApiErrorModel, LoginResponseModel>> login({
    required LoginRequestModel loginRequestModel,
  });
}
