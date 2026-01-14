import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/generated/assets.dart';

class SocialLAccounts extends StatelessWidget {
  final Social social;
  const SocialLAccounts({
    super.key,
    required this.height,
    required this.social,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.iconColor),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.iconsGoogle, height: 24, width: 24),
                Gap(10),
                Text(
                  social == Social.signIn
                      ? "Sign in with Google"
                      : "Sign up with Google",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        Gap(height * 0.02),

        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.iconColor),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.iconsFacebook, height: 24, width: 24),
                Gap(10),
                Text(
                  social == Social.signIn
                      ? "Sign in with facebook"
                      : "Sign up with facebook",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        Gap(height * 0.02),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.iconColor),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.iconsApple, height: 24, width: 24),
                Gap(10),
                Text(
                  social == Social.signIn
                      ? "Sign in with Apple"
                      : "Sign up with Apple",

                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum Social { signIn, signUp }
