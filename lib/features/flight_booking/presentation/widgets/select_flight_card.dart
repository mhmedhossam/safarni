import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/utils/app_colors.dart';

import '../../../../core/functions/format_time.dart';
import '../../data/model/search_flight_model.dart';

class SelectFlightCard extends StatelessWidget {
  final SearchFlightModelData model;
  final bool isSelected;

  const SelectFlightCard({
    super.key,
    required this.model,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    String? layoverText;
    if (model.stops != null && model.stops! > 0) {
      final stopCity = model.layoverDetails?.first.airport ?? "Layover";
      layoverText = "${model.stops} stop: $stopCity";
    }

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.lightGrey : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: isSelected
                ? AppColors.primaryColor.withValues(alpha: 0.2)
                : Colors.black.withValues(alpha: 0.03),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTimeColumn(
                formatTime(model.schedule?.departureTime),
                model.origin?.code ?? "---",
              ),
              Column(
                children: [
                  Icon(Icons.flight_takeoff, color: Colors.grey[400], size: 20),
                  Text(
                    model.schedule?.durationFormatted ?? "--h",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              _buildTimeColumn(
                formatTime(model.schedule?.arrivalTime),
                model.destination?.code ?? "---",
              ),
            ],
          ),
          if (layoverText != null) ...[
            const Gap(4),

            Text(
              layoverText,
              style: TextStyle(color: Colors.grey[400], fontSize: 11),
            ),
          ],
          Gap(5),
          Divider(color: Colors.grey[100], thickness: 1),
          Gap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.airline?.name ?? "Unknown Airline",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                model.pricing?.formatted?.totalPrice ?? "N/A",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeColumn(String time, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(time, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(code, style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }
}
