part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetProductsLoading extends HomeState {}

final class GetProductsSuccess extends HomeState {
  final List<ProductModel> productsList;

  GetProductsSuccess({required this.productsList});
}

final class GetProductsFailure extends HomeState {
  final String errorMessage;
  GetProductsFailure({required this.errorMessage});
}

final class GetCategoriesLoading extends HomeState {}

final class GetCategoriesSuccess extends HomeState {
  GetCategoriesSuccess();
}

final class GetCategoriesFailure extends HomeState {
  final String errorMessage;
  GetCategoriesFailure({required this.errorMessage});
}

final class FilterChangedState extends HomeState {}
