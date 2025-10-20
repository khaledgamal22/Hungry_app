import 'package:flutter/material.dart';
import 'package:hungry/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: HomeViewBody()));
  }
}
