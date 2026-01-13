import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_appbar.dart';
import 'package:round_8_mobile_safarni_team3/features/profile/presentation/controller/cubit/profile_cubit.dart';
import 'package:round_8_mobile_safarni_team3/features/profile/presentation/controller/cubit/profile_state.dart';
import '../widgets/custom_person_info.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Personal Information"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              final profile = state.profile;
              return Column(
                children: [
                  const SizedBox(height: 40),
                  CustomPersonInfo(
                    hint: profile.name,
                    icon: Icons.person,
                    title: "Name",
                  ),
                  const SizedBox(height: 20),
                  CustomPersonInfo(
                    hint: profile.email,
                    icon: Icons.email,
                    title: "Email",
                  ),
                  const SizedBox(height: 20),
                  CustomPersonInfo(
                    hint: profile.location ?? '',
                    icon: Icons.location_on_outlined,
                    title: "Country",
                  ),
                  const SizedBox(height: 20),
                  CustomPersonInfo(
                    hint: profile.phone ?? '',
                    icon: Icons.phone_outlined,
                    title: "Phone Number",
                  ),
                ],
              );
            } else if (state is ProfileFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
