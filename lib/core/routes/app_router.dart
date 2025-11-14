import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/routes/routing.dart';
import 'package:hungry/core/services/get_it_service.dart';
import 'package:hungry/features/checkout/presentation/views/checkout_view.dart';
import 'package:hungry/features/login/presentation/views/login_view.dart';
import 'package:hungry/features/main/presentation/views/main_view.dart';
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
        return _buildRoute(LoginView());
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
        return _buildRoute(ProductDetailsView());
      case Routing.checkout:
        return _buildRoute(CheckoutView());

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
