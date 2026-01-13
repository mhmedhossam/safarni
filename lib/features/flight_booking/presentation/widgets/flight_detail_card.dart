import 'package:flutter/material.dart';

import '../../../../core/functions/format_time.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../generated/assets.dart';
import '../../data/model/search_flight_model.dart';

class FlightDetailsCard extends StatelessWidget {
  final SearchFlightModelData flight;
  final List<dynamic> selectedSeats;

  const FlightDetailsCard({
    super.key,
    required this.flight,
    required this.selectedSeats,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFlightHeader(),
        const SizedBox(height: 20),
        _buildFlightTimeDetails(),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 10),
        _buildFlightInfoGrid(),
        const SizedBox(height: 20),
        _buildPassengerInfo(),
      ],
    );
  }

  Widget _buildFlightHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.airplanemode_active, color: Colors.red),
            const SizedBox(width: 8),
            Text(
              flight.airline?.name ?? "Airline",
              style: TextStyles.details.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(
          flight.flightNumber ?? "---",
          style: TextStyles.details.copyWith(color: Colors.grey[600], fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildFlightTimeDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLocationInfo(
            formatTime(flight.schedule?.departureTime), flight.origin?.code ?? "---"),
        Column(
          children: [
            const Icon(Icons.airplanemode_active, size: 20, color: Colors.black87),
            Text(
              flight.aircraft?.type.toString() ?? '',
              style: TextStyles.details.copyWith(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
        _buildLocationInfo(
            formatTime(flight.schedule?.arrivalTime), flight.destination?.code ?? "---"),
      ],
    );
  }

  Widget _buildLocationInfo(String time, String code) {
    return Column(
      children: [
        Text(time, style: TextStyles.details.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(code, style: TextStyles.details.copyWith(color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildFlightInfoGrid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoItem("Gate", flight.airline?.code ?? ''),
        _buildInfoItem(
          "Seat",
          selectedSeats.isEmpty
              ? "None"
              : selectedSeats.map((s) => s.designation.toString()).join(", "),
        ),
        _buildInfoItem("Terminal", selectedSeats.length.toString()),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: TextStyles.details.copyWith(fontWeight: FontWeight.bold)),
        Text(label, style: TextStyles.details.copyWith(color: Colors.grey[600], fontSize: 12)),
      ],
    );
  }

  Widget _buildPassengerInfo() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(Assets.imagesUserAvatar),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Catherine Dion", style: TextStyles.details.copyWith(fontWeight: FontWeight.bold)),
            Text("24 years, Female", style: TextStyles.details.copyWith(color: Colors.grey[600], fontSize: 12)),
          ],
        ),
        const Spacer(),
        const Icon(Icons.chair, color: AppColors.primaryColor, size: 20),
        const SizedBox(width: 5),
        Text(selectedSeats.isNotEmpty ? "${selectedSeats.first.designation}A" : "--"),
      ],
    );
  }
}