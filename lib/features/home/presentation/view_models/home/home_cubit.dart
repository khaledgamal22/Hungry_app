import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/home/data/models/category_model.dart';
import 'package:hungry/features/home/data/models/product_model.dart';
import 'package:hungry/features/home/data/repos/get_categories_repo/get_categories_repo.dart';
import 'package:hungry/features/home/data/repos/get_products_repo/get_products_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getProductsRepo, required this.getCategoriesRepo})
    : super(HomeInitial());
  List<CategoryModel> categories = [CategoryModel(id: 0, name: 'All')];
  int selectedIndex = 0;

  List<ProductModel> favoriteProducts = [];

  final GetCategoriesRepo getCategoriesRepo;
  final GetProductsRepo getProductsRepo;

  void getCategories() async {
    if (isClosed) return;
    if (categories.length > 1) return;
    emit(GetCategoriesLoading());
    final result = await getCategoriesRepo.getCategories();
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(
            GetCategoriesFailure(
              errorMessage: failure.message ?? "An error occurred",
            ),
          );
        }
      },
      (categoriesList) {
        if (!isClosed) {
          categories.addAll(categoriesList);
          emit(GetCategoriesSuccess());
        }
      },
    );
  }

  void getProducts() async {
    if (isClosed) return;
    emit(GetProductsLoading());
    final result = await getProductsRepo.getProducts(
      categoryId: selectedIndex == 0 ? null : categories[selectedIndex].id,
    );
    try {
      await getFavoriteProducts();
    } catch (e) {
      if (!isClosed) {
        emit(
          GetProductsFailure(errorMessage: "Failed to load favorite products"),
        );
      }
    }
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(
            GetProductsFailure(
              errorMessage: failure.message ?? "An error occurred",
            ),
          );
        }
      },
      (productsList) {
        if (!isClosed) {
          final favIds = favoriteProducts.map((e) => e.id).toList();
          for (var product in productsList) {
            product.isFavorite = favIds.contains(product.id);
          }
          emit(GetProductsSuccess(productsList: productsList));
        }
      },
    );
  }

  Future<void> getFavoriteProducts() async {
    if (isClosed) return;
    final result = await getProductsRepo.getFavoriteProducts();
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(
            GetProductsFailure(
              errorMessage: failure.message ?? "An error occurred",
            ),
          );
        }
      },
      (favorites) {
        if (!isClosed) {
          favoriteProducts = favorites;
          emit(GetFavoriteSuccess());
        }
      },
    );
  }

  void toggleFavoriteStatus(int productId) async {
    if (isClosed) return;
    final result = await getProductsRepo.toggleFavoriteStatus(
      productId: productId,
    );
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(
            GetProductsFailure(
              errorMessage: failure.message ?? "An error occurred",
            ),
          );
        }
      },
      (message) async {
        if (!isClosed) {
          await getFavoriteProducts();
          emit(ToggleFavoriteSuccess(message: message));
        }
      },
    );
  }

  void changeFilter(int index) {
    selectedIndex = index;
    emit(FilterChangedState());
  }
}
