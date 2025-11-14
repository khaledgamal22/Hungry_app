import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_consumer.dart';
import 'package:hungry/core/database/api/api_error_handler.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/core/database/api/end_points.dart';
import 'package:hungry/core/functions/upload_image_to_api.dart';
import 'package:hungry/features/register/data/models/register_request_model.dart';
import 'package:hungry/features/register/data/models/register_response_model.dart';
import 'package:hungry/features/register/data/repos/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiConsumer apiConsumer;

  RegisterRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, RegisterResponseModel>> register({
    required RegisterRequestModel registerRequestModel,
  }) async {
    final Map<String, dynamic> formData = registerRequestModel.toMap();
    formData['image'] = registerRequestModel.profileImagePath != null
        ? await uploadImageToAPI(registerRequestModel.profileImagePath!)
        : null;
    try {
      dynamic response = await apiConsumer.post(
        EndPoints.register,
        data: formData,
      );
      final registerResponseModel = RegisterResponseModel.fromJson(
        response.data,
      );

      return Right(registerResponseModel);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
