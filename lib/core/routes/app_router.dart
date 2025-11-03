import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/routes/routing.dart';
import 'package:hungry/features/checkout/presentation/views/checkout_view.dart';
import 'package:hungry/features/main/presentation/views/main_view.dart';
import 'package:hungry/features/product_details/presentation/views/product_details_view.dart';
import 'package:hungry/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  Route generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case Routing.splash:
        return _buildRoute(SplashView());
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
