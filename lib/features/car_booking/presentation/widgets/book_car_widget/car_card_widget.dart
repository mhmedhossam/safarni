import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';

class CarCardWidget extends StatelessWidget {
  final String name;
  final String type;
  final String seats;
  final String fuel;
  final VoidCallback onRentPressed;
  final VoidCallback onDetailPressed;

  const CarCardWidget({
    super.key,
    required this.name,
    required this.type,
    required this.seats,
    required this.fuel,
    required this.onRentPressed,
    required this.onDetailPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Gap(4),
          Row(
            children: [
              Text(
                "$type • $seats • $fuel",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const Gap(15),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: 'Rent Now',
                  onPressed: onRentPressed,
                ),
              ),
              const Gap(10),
              Expanded(
                child: CustomButton(
                  title: "Detail",
                  onPressed: onDetailPressed,
                  borderColor: AppColors.primaryColor,
                  backgroundColor: Colors.white,
                  textColor: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
