import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/utils/text_styles.dart';

import '../../../../../core/widgets/custom_button.dart';

class PriceSection extends StatelessWidget {
  final List<dynamic> selectedSeats;
  final double totalPrice;
  final VoidCallback onContinue;

  const PriceSection({
    super.key,
    required this.selectedSeats,
    required this.totalPrice,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        // _PriceRow(
        //   label: "Ticket price",
        //   value: "\$${totalPrice.toStringAsFixed(2)} EGP",
        // ),
        _PriceRow(
          label: "Total Price",
          value: "\$${totalPrice.toStringAsFixed(2)} EGP",
        ),
        _PriceRow(
          label: "your Seat",
          value: selectedSeats.isEmpty
              ? "None"
              : selectedSeats.map((s) => s.designation.toString()).join(", "),
          isBold: true,
        ),
        const Gap(20),
        SizedBox(
          width: double.infinity,
          height: 55,
          child: CustomButton(
            title: "Continue",
            onPressed: () {
              selectedSeats.isEmpty ? null : onContinue();
            },
          ),
        ),
      ],
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _PriceRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyles.details.copyWith(color: Colors.black54),
          ),
          Text(
            value,
            style: TextStyles.details.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
