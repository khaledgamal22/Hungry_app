import 'package:dartz/dartz.dart';
import 'package:hungry/core/database/api/api_error_model.dart';
import 'package:hungry/features/product_details/data/models/add_to_cart_model.dart';

abstract class AddToCartRepo {
  Future<Either<ApiErrorModel, String>> addToCart({
    required List<AddToCartModel> items,
  });
}
