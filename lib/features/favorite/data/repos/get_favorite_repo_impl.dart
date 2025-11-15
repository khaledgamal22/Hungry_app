import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_consumer.dart';
import 'package:hungry/core/database/api/api_error_handler.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/features/favorite/data/repos/get_favorite_repo.dart';
import 'package:hungry/features/home/data/models/product_model.dart';

class GetFavoriteRepoImpl implements GetFavoriteRepo {
  final ApiConsumer apiConsumer;
  GetFavoriteRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, List<ProductModel>>>
  getFavoriteProducts() async {
    try {
      final response = await apiConsumer.get('favorites');
      final List<ProductModel> products = (response.data['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      return Right(products);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
