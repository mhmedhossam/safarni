import 'package:flutter/material.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/app_fonts.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/app_colors.dart';

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
    fontSize: 24,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
  );
}
