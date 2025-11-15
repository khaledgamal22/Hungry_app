import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/features/home/data/models/product_model.dart';

abstract class GetProductsRepo {
  Future<Either<ApiErrorModel, List<ProductModel>>> getProducts({
    int? categoryId,
  });
}
