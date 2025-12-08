import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_consumer.dart';
import 'package:hungry/core/database/api/api_error_handler.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/core/database/api/end_points.dart';
import 'package:hungry/features/product_details/data/models/add_to_cart_model.dart';
import 'package:hungry/features/product_details/data/repos/add_to_cart_repo.dart';

class AddToCartRepoImpl implements AddToCartRepo {
  final ApiConsumer apiConsumer;

  AddToCartRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, String>> addToCart({
    required List<AddToCartModel> items,
  }) async {
    try {
      final bodyData = items.map((e) => e.toMap()).toList();
      final reaponse = await apiConsumer.post(
        EndPoints.addToCart,
        data: {"items": bodyData},
      );
      return Right(reaponse.data['message']);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
