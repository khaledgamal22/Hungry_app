import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_consumer.dart';
import 'package:hungry/core/database/api/api_error_handler.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/core/database/api/end_points.dart';
import 'package:hungry/features/home/data/models/product_model.dart';
import 'package:hungry/features/product_details/data/repos/get_product_details_repo.dart';

class GetProductDetailsRepoImpl implements GetProductDetailsRepo {
  final ApiConsumer apiConsumer;

  GetProductDetailsRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, ProductModel>> getProductDetails({
    required int productId,
  }) async {
    try {
      final response = await apiConsumer.get(
        "${EndPoints.getProductDetails}/$productId",
      );
      return Right(ProductModel.fromJson(response.data['data']));
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
