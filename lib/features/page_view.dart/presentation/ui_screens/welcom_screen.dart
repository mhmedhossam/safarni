import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/constants/navigation.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/widgets/custom_button.dart';
import 'package:safarni/generated/assets.dart';

import '../../../../core/constants/routes.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 3),
            Image.asset(Assets.imagesLogo),
            Gap(8),
            Text(
              "Safarni",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 34,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(flex: 1),
            Text(
              "Welcome To Safarni",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                textAlign: TextAlign.center,
                "Safarni is your all-in-one travel guide. Discover destinations, compare trip prices, book flights, hotels, car rentals, and local tours — all through one interactive experience.",
                style: TextStyle(
                  color: AppColors.iconColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Gap(height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButton(
                backgroundColor: AppColors.primaryColor,
                title: "Sign Up",
                onPressed: () {
                  Navigation.push(context, Routes.siginUp);
                },
              ),
            ),
            Gap(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButton(
                backgroundColor: AppColors.whiteColor,
                title: "Log In",
                borderColor: AppColors.primaryColor,
                textColor: AppColors.primaryColor,
                onPressed: () {
                  Navigation.push(context, Routes.login);
                },
              ),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
