import 'package:flutter/material.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/routes.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/text_styles.dart';

class HotelBookingBottomSheet extends StatefulWidget {
  const HotelBookingBottomSheet({super.key});

  @override
  HotelBookingBottomSheetState createState() => HotelBookingBottomSheetState();
}

class HotelBookingBottomSheetState extends State<HotelBookingBottomSheet> {
  int adultCount = 0;
  int childCount = 0;
  int infantCount = 0;

  void incrementAdult() {
    setState(() {
      adultCount++;
    });
  }

  void decrementAdult() {
    setState(() {
      if (adultCount > 0) adultCount--; // Ensure count doesn't go below zero
    });
  }

  void incrementChild() {
    setState(() {
      childCount++;
    });
  }

  void decrementChild() {
    setState(() {
      if (childCount > 0) childCount--; // Ensure count doesn't go below zero
    });
  }

  void incrementInfant() {
    setState(() {
      infantCount++;
    });
  }

  void decrementInfant() {
    setState(() {
      if (infantCount > 0) infantCount--; // Ensure count doesn't go below zero
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Backline Section
          _buildBacklineSection(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildBacklineSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Adults
        _buildPassengerRow(
          title: 'Adults',
          subtitle: 'Ages 18 Or Above',
          count: adultCount,
          onIncrement: incrementAdult,
          onDecrement: decrementAdult,
        ),
        Divider(color: Color(0xffE5E7EB)),
        const SizedBox(height: 12),

        // Children
        _buildPassengerRow(
          title: 'Children',
          subtitle: 'Ages 2-17',
          count: childCount,
          onIncrement: incrementChild,
          onDecrement: decrementChild,
        ),
        Divider(color: Color(0xffE5E7EB)),
        const SizedBox(height: 12),

        // Infants
        _buildPassengerRow(
          title: 'Infants',
          subtitle: "Under Ages 2",
          count: infantCount,
          onIncrement: incrementInfant,
          onDecrement: decrementInfant,
        ),
        Divider(color: Color(0xffE5E7EB)),

        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: ElevatedButton(
            onPressed: () {
              Navigation.push(context, Routes.checkOut);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E429F),
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Center(
              child: Text(
                'Check Out',
                style: TextStyles.details.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPassengerRow({
    required String title,
    required String subtitle,
    required int count,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Title and Subtitle
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.details.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF111928),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyles.details.copyWith(
                fontSize: 15,
                color: const Color(0xFF4B5563),
              ),
            ),
          ],
        ),

        // Counter
        Row(
          children: [
            IconButton(
              icon: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(Icons.remove, color: Colors.white),
              ),
              onPressed: onDecrement,
            ),
            Text(
              '$count',
              style: TextStyles.details.copyWith(
                fontSize: 16,
                color: const Color(0xFF111928),
              ),
            ),
            IconButton(
              icon: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E429F),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
              onPressed: onIncrement,
            ),
          ],
        ),
      ],
    );
  }
}
