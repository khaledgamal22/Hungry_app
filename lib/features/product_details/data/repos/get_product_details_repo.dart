import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/features/home/data/models/product_model.dart';

abstract class GetProductDetailsRepo {
  Future<Either<ApiErrorModel, ProductModel>> getProductDetails({
    required int productId,
  });
}
