import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../generated/assets.dart';

class TicketPriceAndScan extends StatelessWidget {
  final double totalPrice;

  const TicketPriceAndScan({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTicketSeparator(),
        const SizedBox(height: 20),
        Text(
          "Total Paid: ${totalPrice.toStringAsFixed(2)} EGP",
          style: TextStyles.details.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.asset(
            Assets.imagesScan,
            height: 180,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget _buildTicketSeparator() {
    return Row(
      children: [
        _buildHalfCircle(true),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    (constraints.constrainWidth() / 10).floor(),
                        (index) => const SizedBox(
                      width: 5,
                      height: 1,
                      child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey)),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        _buildHalfCircle(false),
      ],
    );
  }

  Widget _buildHalfCircle(bool isLeft) {
    return SizedBox(
      height: 20,
      width: 10,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withValues(alpha: 0.4),
          borderRadius: BorderRadius.only(
            topRight: isLeft ? const Radius.circular(10) : Radius.zero,
            bottomRight: isLeft ? const Radius.circular(10) : Radius.zero,
            topLeft: !isLeft ? const Radius.circular(10) : Radius.zero,
            bottomLeft: !isLeft ? const Radius.circular(10) : Radius.zero,
          ),
        ),
      ),
    );
  }
}