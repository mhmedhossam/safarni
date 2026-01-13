import 'package:flutter/material.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/utils/text_styles.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';

class OnBoardingHeader extends StatefulWidget {
  final int currentIndex;
  const OnBoardingHeader({super.key, required this.currentIndex});

  @override
  State<OnBoardingHeader> createState() => _OnBoardingHeaderState();
}

class _OnBoardingHeaderState extends State<OnBoardingHeader> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Safarni",
            style: TextStyles.header,
            selectionColor: AppColors.primaryColor,
          ),
          widget.currentIndex != 2
              ? Row(
                  children: [
                    Text("Skip", style: TextStyles.title),
                    IconButton(
                      onPressed: () {
                        Navigation.push(context, Routes.welcom);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
