import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/database/cache/cache_helper.dart';
import 'package:hungry/core/database/cache/cache_keys.dart';
import 'package:hungry/core/services/get_it_service.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/profile/presentation/view_models/profile/profile_cubit.dart';
import 'package:hungry/features/profile/presentation/views/widgets/edit_profile.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      getIt<CacheHelper>().getString(key: 'profileImage')!,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  getIt<CacheHelper>().getString(key: CacheKeys.name)!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  getIt<CacheHelper>().getString(key: CacheKeys.email)!,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Gap(10),
                EditProfile(),
                const SizedBox(height: 40),
                ListTile(
                  leading: Icon(Icons.favorite, color: AppColors.primary),
                  title: Text('Favorites'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: AppColors.red),
                  title: Text('Log Out'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle log out
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
