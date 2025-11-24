import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_consumer.dart';
import 'package:hungry/core/database/api/api_error_handler.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/core/database/api/end_points.dart';
import 'package:hungry/features/cart/data/models/cart_model_response.dart';
import 'package:hungry/features/cart/data/repos/get_cart_products_repo.dart';

class GetCartProductsRepoImpl implements GetCartProductsRepo {
  final ApiConsumer apiConsumer;

  GetCartProductsRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, CartModelResponse>> getCartProducts() async {
    try {
      final response = await apiConsumer.get(EndPoints.getCartProducts);
      final cartModelResponse = CartModelResponse.fromJson(
        response.data['data'],
      );
      return Right(cartModelResponse);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
