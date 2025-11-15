import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/services/get_it_service.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/cart/presentation/views/cart_view.dart';
import 'package:hungry/features/home/data/repos/get_categories_repo/get_categories_repo.dart';
import 'package:hungry/features/home/data/repos/get_products_repo/get_products_repo.dart';
import 'package:hungry/features/home/presentation/view_models/home/home_cubit.dart';
import 'package:hungry/features/home/presentation/views/home_view.dart';
import 'package:hungry/features/profile/data/repos/get_user_profile_repo.dart';
import 'package:hungry/features/profile/presentation/view_models/profile/profile_cubit.dart';
import 'package:hungry/features/profile/presentation/views/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late List<Widget> screens;
  int currentIndex = 0;
  @override
  void initState() {
    screens = [
      BlocProvider(
        create: (context) =>
            HomeCubit(
                getCategoriesRepo: getIt<GetCategoriesRepo>(),
                getProductsRepo: getIt<GetProductsRepo>(),
              )
              ..getCategories()
              ..getProducts(),
        child: HomeView(),
      ),
      CartView(),
      SizedBox(),
      BlocProvider(
        create: (context) => ProfileCubit(getIt<GetUserProfileRepo>()),
        child: ProfileViews(),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedItemColor: AppColors.white,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.local_restaurant),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
