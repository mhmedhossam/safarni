import 'package:flutter/material.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import 'profile_menu_item.dart';

class ProfileMenuList extends StatelessWidget {
  const ProfileMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileMenuItem(
          icon: Icons.person_outline,
          title: 'Personal Info',
          onTap: () {
            Navigation.push(context, Routes.persoalInfo);
          },
        ),
        ProfileMenuItem(
          icon: Icons.lock_outline,
          title: 'Account & Security',
          onTap: () {
            Navigation.push(context, Routes.security);
          },
        ),
        ProfileMenuItem(
          icon: Icons.calendar_today_outlined,
          title: 'My Booking',
          onTap: () {
            Navigation.push(context, Routes.mybookingScreen);
          },
        ),
        ProfileMenuItem(
          icon: Icons.language,
          title: 'App Language',
          onTap: () {
            //log('Navigate to App Language');
          },
        ),
        ProfileMenuItem(
          icon: Icons.logout,
          title: 'Logout',
          titleColor: Colors.red,
          iconColor: Colors.red,
          showArrow: false,
          onTap: () {
            Navigation.go(context, Routes.login);
          },
        ),
      ],
    );
  }
}
