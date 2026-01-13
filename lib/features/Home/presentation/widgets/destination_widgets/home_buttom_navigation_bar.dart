import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/constants/navigation.dart';
import 'package:safarni/core/constants/routes.dart';
import 'package:safarni/core/widgets/custom_button.dart';

class HomeButtonNavigationBar extends StatelessWidget {
  const HomeButtonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.5), blurRadius: 10),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total Price"),
              Gap(10),
              const Text(
                '\$1500 /per person',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Gap(30),
          Expanded(
            child: CustomButton(
              title: "Book Now",
              onPressed: () {
                Navigation.push(context, Routes.checkOut);
              },
            ),
          ),
        ],
      ),
    );
  }
}
