import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/widgets/custom_button.dart';
import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/assets.dart';

class PasswordReseted extends StatefulWidget {
  const PasswordReseted({super.key});

  @override
  State<PasswordReseted> createState() => _PasswordResetedState();
}

class _PasswordResetedState extends State<PasswordReseted> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigation.go(context, Routes.login);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                SvgPicture.asset(Assets.iconsCorrect),
                Gap(height * 0.02),

                Text(
                  "password reset",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(height * 0.02),
                Text(
                  textAlign: TextAlign.center,
                  "your password has been  successfully reset click below to log in magically.",
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(height * 0.03),
                Gap(height * 0.02),
                CustomButton(
                  title: "Log In",
                  onPressed: () {
                    Navigation.push(context, Routes.login);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
