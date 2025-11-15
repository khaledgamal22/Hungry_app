import 'package:flutter/material.dart';
import 'package:hungry/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileViews extends StatelessWidget {
  const ProfileViews({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: ProfileViewBody()));
  }
}
