import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/routes/routing.dart';
import 'package:hungry/core/services/get_it_service.dart';
import 'package:hungry/features/checkout/presentation/views/checkout_view.dart';
import 'package:hungry/features/favorite/data/repos/get_favorite_repo.dart';
import 'package:hungry/features/favorite/presentation/view_models/favorite/favorite_cubit.dart';
import 'package:hungry/features/favorite/presentation/views/favorite_view.dart';
import 'package:hungry/features/login/data/repos/login_repo.dart';
import 'package:hungry/features/login/presentation/view_models/login/login_cubit.dart';
import 'package:hungry/features/login/presentation/views/login_view.dart';
import 'package:hungry/features/main/presentation/views/main_view.dart';
import 'package:hungry/features/product_details/data/repos/get_product_details_repo.dart';
import 'package:hungry/features/product_details/presentation/view_models/product_details/product_details_cubit.dart';
import 'package:hungry/features/product_details/presentation/views/product_details_view.dart';
import 'package:hungry/features/register/data/repos/register_repo.dart';
import 'package:hungry/features/register/presentation/view_models/register/register_cubit.dart';
import 'package:hungry/features/register/presentation/views/register_view.dart';
import 'package:hungry/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  Route generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case Routing.splash:
        return _buildRoute(SplashView());
      case Routing.login:
        return _buildRoute(
          BlocProvider(
            create: (context) => LoginCubit(getIt<LoginRepo>()),
            child: LoginView(),
          ),
        );
      case Routing.register:
        return _buildRoute(
          BlocProvider(
            create: (context) => RegisterCubit(getIt<RegisterRepo>()),
            child: RegisterView(),
          ),
        );
      case Routing.main:
        return _buildRoute(MainView());
      case Routing.productDetails:
        final productId = settings.arguments as int;
        return _buildRoute(
          BlocProvider(
            create: (context) =>
                ProductDetailsCubit(getIt<GetProductDetailsRepo>())
                  ..getProductDetails(productId: productId),
            child: ProductDetailsView(),
          ),
        );
      case Routing.checkout:
        return _buildRoute(CheckoutView());
      case Routing.favorite:
        return _buildRoute(
          BlocProvider(
            create: (context) =>
                FavoriteCubit(getIt<GetFavoriteRepo>())..getFavoriteProducts(),
            child: FavoriteView(),
          ),
        );

      default:
        return _buildRoute(
          const Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }

  Route<dynamic> _buildRoute(Widget page) {
    return Platform.isIOS
        ? CupertinoPageRoute(builder: (_) => page)
        : MaterialPageRoute(builder: (_) => page);
  }
}
