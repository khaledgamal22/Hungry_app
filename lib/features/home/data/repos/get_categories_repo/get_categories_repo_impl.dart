import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_consumer.dart';
import 'package:hungry/core/database/api/api_error_handler.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/core/database/api/end_points.dart';
import 'package:hungry/features/home/data/models/category_model.dart';
import 'package:hungry/features/home/data/repos/get_categories_repo/get_categories_repo.dart';

class GetCategoriesRepoImpl implements GetCategoriesRepo {
  final ApiConsumer apiConsumer;

  GetCategoriesRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, List<CategoryModel>>> getCategories() async {
    try {
      final response = await apiConsumer.get(EndPoints.getCategories);
      final List<CategoryModel> categories = (response.data['data'] as List)
          .map((categoryJson) => CategoryModel.fromJson(categoryJson))
          .toList();
      return Right(categories);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
