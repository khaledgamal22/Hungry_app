import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/features/register/data/models/register_request_model.dart';
import 'package:hungry/features/register/data/models/register_response_model.dart';

abstract class RegisterRepo {
  Future<Either<ApiErrorModel, RegisterResponseModel>> register({
    required RegisterRequestModel registerRequestModel,
  });
}
