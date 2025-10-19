import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/core/utils/app_images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  bool _animateText = false;
  bool _animateImage = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        _animateText = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        _animateImage = true;
      });
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        // Navigate to the next screen, e.g., LoginView
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          Gap(height * 0.3),
          AnimatedSlide(
            offset: _animateText ? Offset.zero : const Offset(0, -0.2),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              opacity: _animateText ? 1 : 0,
              duration: const Duration(milliseconds: 800),
              child: Text(
                'HUNGRY?',
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Luckiest Guy',
                ),
              ),
            ),
          ),

          const Spacer(),
          AnimatedSlide(
            offset: _animateImage ? Offset.zero : const Offset(0, 0.2),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              opacity: _animateImage ? 1 : 0,
              duration: const Duration(milliseconds: 800),
              child: Image.asset(AppImages.splashSandwitch),
            ),
          ),
        ],
      ),
    );
  }
}
