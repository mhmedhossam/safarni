import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class REsetPasswordHeader extends StatelessWidget {
  const REsetPasswordHeader({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.lock_outline_rounded, size: 50, color: Colors.grey),
        Text(
          "Set new Password",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),

        Gap(height * 0.02),
        Text(
          textAlign: TextAlign.center,
          "Your new password must be different from previous used passwords.",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
