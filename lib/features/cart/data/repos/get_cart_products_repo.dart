import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/features/cart/data/models/cart_model_response.dart';

abstract class GetCartProductsRepo {
  Future<Either<ApiErrorModel, CartModelResponse>> getCartProducts();
}
