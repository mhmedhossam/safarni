import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BuildRequirements extends StatelessWidget {
  final bool isVal;
  const BuildRequirements({super.key, required this.text, required this.isVal});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isVal
            ? Icon(Icons.check_circle_outline, color: Colors.green, size: 20)
            : Icon(
                Icons.check_circle_outline,
                color: Colors.grey.shade400,
                size: 20,
              ),
        Gap(8),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
