import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_fonts.dart';
import 'package:safarni/core/utils/app_colors.dart';

class TextStyles {
  static final TextStyle title = const TextStyle(
    fontFamily: AppFonts.title,
    fontSize: 20,
    color: AppColors.blackColor,
  );
  static final TextStyle details = const TextStyle(
    fontFamily: AppFonts.details,
    fontSize: 16,
    fontWeight: FontWeight.w600,

    color: AppColors.greyColor,
  );
  static final TextStyle header = const TextStyle(
    fontFamily: AppFonts.header,
    fontSize: 30,

    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold,
  );
}
