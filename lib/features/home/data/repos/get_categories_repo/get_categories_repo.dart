import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/features/home/data/models/category_model.dart';

abstract class GetCategoriesRepo {
  Future<Either<ApiErrorModel, List<CategoryModel>>> getCategories();
}
