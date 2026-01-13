import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/constants/routes.dart';
import 'package:safarni/core/utils/text_styles.dart';
import 'package:safarni/core/widgets/custom_appbar.dart';
import 'package:safarni/core/widgets/custom_button.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../generated/assets.dart';
import '../widgets/car_detail_widgets/plan_card_section.dart';

class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Car Detail'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.asset(
                Assets.imagesCar1,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(20),
            const Text("Popular Cars", style: TextStyle(color: Colors.grey)),
            const Text(
              "S 500 Sedan",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSpecItem("Power", "429 hp"),
                _buildSpecItem("Max Speed", "280 km/h"),
                _buildSpecItem("Acceleration", "4.9 sec"),
              ],
            ),
            const Gap(30),
            const Text("Plan", style: TextStyle(fontWeight: FontWeight.bold)),
            const Gap(10),
            Row(
              children: [
                PlanCardSection(
                  title: "Hourly Rent",
                  subTitle: "Best for business appointments",
                  price: "10",
                  icon: Icons.access_time,
                  isSelected: true,
                ),
                const Gap(15),
                PlanCardSection(
                  title: "Daily Rent",
                  subTitle: "Best for business appointments",
                  price: "80",
                  icon: Icons.calendar_today_outlined,
                  isSelected: false,
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
              title: "Pick Up",
              onPressed: () {
                Navigation.push(context, Routes.carMapScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyles.details.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
