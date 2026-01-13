import 'package:flutter/material.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_button.dart';
import 'package:round_8_mobile_safarni_team3/generated/assets.dart';

import '../../../../core/constants/routes.dart';

class Welcom extends StatelessWidget {
  const Welcom({super.key});

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 3),
            Image.asset(Assets.imagesLogo),
            SizedBox(height: 8),
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
              "Welcome",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                textAlign: TextAlign.center,
                "Fitsync is a platform for gym and bodybuilding enthusiasts. Find nearby gyms, read reviews, get discounts, buy sports products, and access courses.",
                style: TextStyle(
                  color: AppColors.iconColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
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
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButton(
                backgroundColor: AppColors.whiteColor,
                title: "Log in",
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
