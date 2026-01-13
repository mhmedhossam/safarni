import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/utils/text_styles.dart';

class ReviewCardWidget extends StatelessWidget {
  final String name;
  final int stars;
  final String time;
  final String image;
  final String details;

  const ReviewCardWidget({
    super.key,
    required this.name,
    required this.stars,
    required this.time,
    required this.image,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.greyColor.withValues(alpha: 0.5)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(image), maxRadius: 20),
              Gap(10),
              Text(
                name,
                style: TextStyles.details.copyWith(color: AppColors.blackColor),
              ),
              Spacer(),
              Text(time),
            ],
          ),
          Gap(10),

          FivePointedStar(
            size: Size(20, 20),
            gap: 1,
            color: Colors.grey[300]!,
            selectedColor: Colors.amber,
            defaultSelectedCount: stars,
            disabled: true,
            count: 5,
          ),
          Gap(10),
          Text(
            details,
            style: TextStyles.details.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
