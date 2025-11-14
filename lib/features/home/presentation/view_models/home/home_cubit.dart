import 'package:bloc/bloc.dart';
import 'package:hungry/features/home/data/models/category_model.dart';
import 'package:hungry/features/home/data/repos/get_categories_repo/get_categories_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getCategoriesRepo}) : super(HomeInitial());
  List<CategoryModel> categories = [];
  int selectedIndex = 0;

  final GetCategoriesRepo getCategoriesRepo;

  void getCategories() async {
    emit(GetCategoriesLoading());
    final result = await getCategoriesRepo.getCategories();
    result.fold(
      (failure) => emit(
        GetCategoriesFailure(
          errorMessage: failure.message ?? "An error occurred",
        ),
      ),
      (categories) {
        this.categories = categories;
        emit(GetCategoriesSuccess(categories: categories));
      },
    );
  }

  void changeFilter(int index) {
    selectedIndex = index;
    emit(FilterChangedState());
  }
}
