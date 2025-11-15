import 'package:bloc/bloc.dart';
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

  final GetCategoriesRepo getCategoriesRepo;
  final GetProductsRepo getProductsRepo;

  void getCategories() async {
    if (categories.length > 1) return;
    emit(GetCategoriesLoading());
    final result = await getCategoriesRepo.getCategories();
    result.fold(
      (failure) => emit(
        GetCategoriesFailure(
          errorMessage: failure.message ?? "An error occurred",
        ),
      ),
      (categoriesList) {
        categories.addAll(categoriesList);
        emit(GetCategoriesSuccess());
      },
    );
  }

  void getProducts() async {
    emit(GetProductsLoading());
    final result = await getProductsRepo.getProducts(
      categoryId: selectedIndex == 0 ? null : categories[selectedIndex].id,
    );
    result.fold(
      (failure) => emit(
        GetProductsFailure(
          errorMessage: failure.message ?? "An error occurred",
        ),
      ),
      (productsList) {
        emit(GetProductsSuccess(productsList: productsList));
      },
    );
  }

  void changeFilter(int index) {
    selectedIndex = index;
    emit(FilterChangedState());
  }
}
