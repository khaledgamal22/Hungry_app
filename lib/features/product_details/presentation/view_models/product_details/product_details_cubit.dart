import 'package:bloc/bloc.dart';
import 'package:hungry/features/home/data/models/product_model.dart';
import 'package:hungry/features/product_details/data/repos/get_product_details_repo.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.getProductDetailsRepo)
    : super(ProductDetailsInitial());
  final GetProductDetailsRepo getProductDetailsRepo;

  void getProductDetails({required int productId}) async {
    emit(ProductDetailsLoading());
    final result = await getProductDetailsRepo.getProductDetails(
      productId: productId,
    );
    result.fold(
      (failure) => emit(
        ProductDetailsFailure(
          errorMessage: failure.message ?? "An error occurred",
        ),
      ),
      (productModel) => emit(ProductDetailsSuccess(productModel: productModel)),
    );
  }
}
