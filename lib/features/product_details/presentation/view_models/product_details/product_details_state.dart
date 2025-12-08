part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsSuccess extends ProductDetailsState {
  final ProductModel productModel;

  ProductDetailsSuccess({required this.productModel});
}

final class ProductDetailsFailure extends ProductDetailsState {
  final String errorMessage;
  ProductDetailsFailure({required this.errorMessage});
}

final class AddToCartSuccess extends ProductDetailsState {
  final String message;
  AddToCartSuccess({required this.message});
}

final class AddToCartFailure extends ProductDetailsState {
  final String errorMessage;
  AddToCartFailure({required this.errorMessage});
}

final class AddToCartUpdated extends ProductDetailsState {}

final class AddToCartLoading extends ProductDetailsState {}

// final class ToppingAdded extends ProductDetailsState {}
// final class SideOptionAdded extends ProductDetailsState {}
