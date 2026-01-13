import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/widgets/custom_button.dart';
import 'package:safarni/features/auth/presentation/widgets/build_requirments.dart';

class PasswordRequirements extends StatelessWidget {
  final VoidCallback onResetPassword;
  final VoidCallback onBackToLogin;
  final bool is8Char;
  final bool isSpecialOne;

  const PasswordRequirements({
    super.key,
    required this.onResetPassword,
    required this.onBackToLogin,
    required this.is8Char,
    required this.isSpecialOne,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildRequirements(
          text: "Must Be At Least 8 Characters",
          isVal: is8Char,
        ),
        Gap(8),
        BuildRequirements(
          text: "Must Contain One Special Character",
          isVal: isSpecialOne,
        ),
        Gap(24),
        CustomButton(title: "Reset Password", onPressed: onResetPassword),
        Gap(16),
        Center(
          child: TextButton.icon(
            onPressed: onBackToLogin,
            icon: Icon(Icons.arrow_back, color: AppColors.blackColor, size: 20),
            label: Text(
              "Back To Log in",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
