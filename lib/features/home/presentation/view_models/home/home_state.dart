part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetCategoriesLoading extends HomeState {}

final class GetCategoriesSuccess extends HomeState {
  final List<CategoryModel> categories;
  GetCategoriesSuccess({required this.categories});
}

final class GetCategoriesFailure extends HomeState {
  final String errorMessage;
  GetCategoriesFailure({required this.errorMessage});
}

final class FilterChangedState extends HomeState {}
