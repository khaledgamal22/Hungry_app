import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_consumer.dart';
import 'package:hungry/core/database/api/api_error_handler.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/core/database/api/end_points.dart';
import 'package:hungry/features/home/data/models/product_model.dart';
import 'package:hungry/features/home/data/repos/get_products_repo/get_products_repo.dart';

class GetProductsRepoImpl implements GetProductsRepo {
  final ApiConsumer apiConsumer;

  GetProductsRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, List<ProductModel>>> getProducts({
    int? categoryId,
  }) async {
    try {
      final response = await apiConsumer.get(
        EndPoints.getProducts,
        data: categoryId != null ? {'category_id': categoryId} : null,
      );
      final List<ProductModel> products = (response.data['data'] as List)
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();
      return Right(products);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, List<ProductModel>>>
  getFavoriteProducts() async {
    try {
      final response = await apiConsumer.get(EndPoints.getFavorites);
      final List<ProductModel> products = (response.data['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      return Right(products);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, String>> toggleFavoriteStatus({
    required int productId,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.toggleFavorite,
        data: {'product_id': productId},
      );
      final String message = response.data['message'];
      return Right(message);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
