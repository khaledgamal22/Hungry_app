import 'package:bloc/bloc.dart';
import 'package:hungry/features/favorite/data/repos/get_favorite_repo.dart';
import 'package:hungry/features/home/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.getFavoriteRepo) : super(FavoriteInitial());
  final GetFavoriteRepo getFavoriteRepo;

  void getFavoriteProducts() async {
    emit(FavoriteLoading());
    final result = await getFavoriteRepo.getFavoriteProducts();
    result.fold(
      (failure) => emit(
        FavoriteFailure(errorMessage: failure.message ?? "An error occurred"),
      ),
      (favoriteProducts) {
        emit(FavoriteSuccess(favoriteProducts: favoriteProducts));
      },
    );
  }
}
