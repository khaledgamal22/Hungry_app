import 'package:bloc/bloc.dart';
import 'package:hungry/features/cart/data/models/cart_model_response.dart';
import 'package:hungry/features/cart/data/repos/get_cart_products_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.getCartProductsRepo) : super(CartInitial());
  final GetCartProductsRepo getCartProductsRepo;

  void getCartProducts() async {
    emit(GetCartProductsLoading());
    final result = await getCartProductsRepo.getCartProducts();
    result.fold(
      (failure) {
        emit(
          GetCartProductsFailure(
            errorMessage: failure.message ?? "An error occurred",
          ),
        );
      },
      (cart) {
        emit(GetCartProductsSuccess(cartResponse: cart));
      },
    );
  }
}
