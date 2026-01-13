import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/di/service_locator.dart';
import 'package:safarni/core/widgets/custom_appbar.dart';
import 'package:safarni/features/profile/presentation/controller/cubit/profile_cubit.dart';
import '../controller/cubit/profile_state.dart';
import '../widgets/info_details.dart';
import '../widgets/profile_image.dart';
import '../widgets/profile_menu_list.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.gi<ProfileCubit>()..fetchProfile(),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ""),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const CircularProgressIndicator();
                } else if (state is ProfileLoaded) {
                  final profile = state.profile;
                  return Column(
                    children: [
                      ProfileImage(imageUrl: profile.profileImage),
                      const Gap(10),
                      InfoDetails(name: profile.name, email: profile.email),
                      const Gap(20),
                      ProfileMenuList(),
                    ],
                  );
                } else if (state is ProfileFailure) {
                  return Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
