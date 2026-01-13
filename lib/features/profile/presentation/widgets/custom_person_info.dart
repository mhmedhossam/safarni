import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/widgets/custom_text_form_field.dart';

class CustomPersonInfo extends StatelessWidget {
  const CustomPersonInfo({
    super.key,
    required this.title,
    required this.hint,
    required this.icon,
  });
  final String title;
  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Gap(5),
        CustomTextForm(hint: hint, readonly: true, prefix: Icon(icon)),
      ],
    );
  }
}
