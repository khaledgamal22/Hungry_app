import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/home/presentation/views/home_view.dart';

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
    screens = [HomeView(), SizedBox(), SizedBox(), SizedBox()];
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
                icon: const Icon(Icons.favorite_border),
                label: 'Favorites',
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
