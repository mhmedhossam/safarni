import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/utils/text_styles.dart';
import 'package:safarni/core/widgets/custom_button.dart';

import '../../../../../core/constants/navigation.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../../generated/assets.dart';

class MapCardDetail extends StatelessWidget {
  const MapCardDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "S 500 Sedan",
                    style: TextStyles.details.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Text(
                        "Automatic",
                        style: TextStyles.details.copyWith(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const Gap(10),

                      Text(
                        "5 seats",
                        style: TextStyles.details.copyWith(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        "Diesel",
                        style: TextStyles.details.copyWith(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset(
                Assets.imagesCar1,
                width: 150,
                height: 120,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.directions_car, size: 50),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$80 / hour",
                    style: TextStyles.details.copyWith(color: Colors.grey),
                  ),
                  Text(
                    "\$400 / day",
                    style: TextStyles.details.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 150,
                child: CustomButton(
                  onPressed: () {
                    Navigation.push(context, Routes.checkOut);
                  },
                  title: "Confirm",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
