part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class GetCartProductsLoading extends CartState {}

final class GetCartProductsSuccess extends CartState {
  final CartModelResponse cartResponse;
  GetCartProductsSuccess({required this.cartResponse});
}

final class GetCartProductsFailure extends CartState {
  final String errorMessage;
  GetCartProductsFailure({required this.errorMessage});
}
