import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:safarni/core/utils/app_colors.dart';

class CustomDatePicker {
  static Future<void> selectDate({
    required BuildContext context,
    required TextEditingController controller,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String format = 'yyyy-MM-DD',
  }) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      controller.text = DateFormat(format).format(pickedDate);
    }
  }
}
