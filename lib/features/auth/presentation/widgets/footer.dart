import 'package:flutter/material.dart';
import 'package:safarni/core/utils/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, this.onPressed, this.text, this.infoText});

  final void Function()? onPressed;
  final String? text;
  final String? infoText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(infoText ?? "Don't have an account? "),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text ?? "Sign Up",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
