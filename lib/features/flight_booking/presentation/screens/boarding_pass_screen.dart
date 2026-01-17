import 'package:flutter/material.dart';

import 'package:safarni/core/widgets/custom_appbar.dart';
import 'package:safarni/core/widgets/custom_button.dart';
import 'package:safarni/features/flight_booking/presentation/widgets/flight_detail_card.dart';
import 'package:safarni/features/flight_booking/presentation/widgets/ticket_price_scan.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../../data/model/search_flight_model.dart';

class BoardingPassScreen extends StatelessWidget {
  final SearchFlightModelData flight;
  final List<dynamic> selectedSeats;
  final double totalPrice;

  const BoardingPassScreen({
    super.key,
    required this.flight,
    required this.selectedSeats,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,

      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: "Boarding Pass"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: FlightDetailsCard(
                          flight: flight,
                          selectedSeats: selectedSeats,
                        ),
                      ),

                      TicketPriceAndScan(totalPrice: totalPrice),
                    ],
                  ),
                ),
                // const Spacer(),
                CustomButton(
                  title: "Check Out",
                  onPressed: () => Navigation.push(context, Routes.checkOut),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
