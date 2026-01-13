import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/utils/text_styles.dart';
import 'package:safarni/generated/assets.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
            ),
          ],
        ),
        padding: EdgeInsets.all(4),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),

              child: Image.asset(
                Assets.imagesPv3,
                width: 100,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Full Day Tour',
                    style: TextStyles.details.copyWith(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Eiffle Tour',
                    style: TextStyles.details.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'From 230\$ per peron',
                    style: TextStyles.details.copyWith(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: AlignmentGeometry.topRight,
              child: Icon(
                CupertinoIcons.heart_fill,
                color: CupertinoColors.systemRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
