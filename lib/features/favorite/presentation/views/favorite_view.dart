import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/services/get_it_service.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/favorite/data/repos/get_favorite_repo.dart';
import 'package:hungry/features/favorite/presentation/view_models/favorite/favorite_cubit.dart';
import 'package:hungry/features/favorite/presentation/views/widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavoriteCubit(getIt<GetFavoriteRepo>())..getFavoriteProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Favorite',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.white,
        ),
        body: FavoriteViewBody(),
      ),
    );
  }
}
