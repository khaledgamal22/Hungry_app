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
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final PersistentTabController controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _screens() {
    return [HomeView(), CartView(), SizedBox(), ProfileViews()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: "Home",
        activeColorPrimary: AppColors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.cart),
        title: "Cart",
        activeColorPrimary: AppColors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.local_restaurant),
        title: "Orders",
        activeColorPrimary: AppColors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: "Profile",
        activeColorPrimary: AppColors.white,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              HomeCubit(
                  getCategoriesRepo: getIt<GetCategoriesRepo>(),
                  getProductsRepo: getIt<GetProductsRepo>(),
                )
                ..getCategories()
                ..getProducts(),
        ),
        BlocProvider(create: (_) => ProfileCubit(getIt<GetUserProfileRepo>())),
      ],
      child: LiquidGlassLayer(
        settings: LiquidGlassSettings(
          glassColor: AppColors.white.withValues(alpha: 0.2),
          thickness: 20,
          blur: 15,
        ),
        child: LiquidGlass(
          shape: LiquidRoundedRectangle(borderRadius: 20),
          child: PersistentTabView(
            context,
            controller: controller,
            screens: _screens(),
            items: _navBarsItems(),
            navBarStyle: NavBarStyle.style6,
            backgroundColor: AppColors.primary,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            navBarHeight: kBottomNavigationBarHeight + 10,
            padding: const EdgeInsets.only(top: 12),
            bottomScreenMargin: 0,
          ),
        ),
      ),
    );
  }
}
