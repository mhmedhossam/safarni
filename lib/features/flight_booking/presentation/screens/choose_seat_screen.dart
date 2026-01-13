import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_appbar.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_snack_bar.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/utils/text_styles.dart';
import '../../data/model/search_flight_model.dart';
import '../cubit/flight_cubit.dart';
import '../widgets/choose_seat_widgets/price_section.dart';

class SeatSelectionScreen extends StatefulWidget {
  final SearchFlightModelData flight;
  const SeatSelectionScreen({super.key,required this.flight});

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  Set<String> selectedSeatIds = {};
  List<dynamic> selectedSeatsObjects = [];
  double totalPrice =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "choose Seats"),
      body: BlocBuilder<FlightCubit, FlightState>(
        builder: (context, state) {
          if (state is FlightSeatsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FlightSeatsFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Error: ${state.errorMessage}")],
              ),
            );
          } else if (state is FlightSeatsSuccess) {
            final seats = state.flightSeatModel.data?.seatsByClass;

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LegendItem(
                        color: AppColors.primaryColor,
                        text: "Available",
                      ),
                      LegendItem(
                        color: AppColors.brightGreen,
                        text: "Selected",
                      ),
                      LegendItem(
                        color: AppColors.darkGrey,
                        text: "Locked/Booked",
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                child: Text(
                                  "Business Class",
                                  style: TextStyles.title,
                                ),
                              ),
                              buildSeatGrid(seats!.business!, 5, 0),
                            ],
                          ),

                          const SizedBox(width: 50),

                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                child: Text(
                                  "Economy Class",
                                  style: TextStyles.title,
                                ),
                              ),
                              buildSeatGrid(
                                seats.economy!,
                                5,
                                seats.business!.length,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  PriceSection(
                    selectedSeats: selectedSeatsObjects,
                    totalPrice: totalPrice,
                    onContinue: () {

                      Navigation.push(context, Routes.boardingPassScreen, {
                        'flight': widget.flight,
                        'selectedSeats': selectedSeatsObjects,
                        'totalPrice': totalPrice,
                      });
                    },
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget buildSeatGrid(List<dynamic> seats, int crossCount, int offset) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: seats.length,
      itemBuilder: (context, index) {
        final seat = seats[index];

        bool isSelected = selectedSeatIds.contains(seat.id);
        bool isAvailable =
            (seat.isAvailable ?? false) && !(seat.isLocked ?? true);

        return GestureDetector(
          onTap: () {
            if (!isAvailable) {
              CustomSnackBar.showWarning(context, "This seat is unavailable.");
              return;
            }
            setState(() {
              if (isSelected) {
                selectedSeatIds.remove(seat.id);
                selectedSeatsObjects.removeWhere((s) => s.id == seat.id);
              } else {
                selectedSeatIds.add(seat.id!);
                selectedSeatsObjects.add(seat);
              }
              totalPrice = selectedSeatsObjects.fold(0.0, (sum, item) {
                return sum + (item.priceModifierEgp ?? 0.0);
              });
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _getSeatColor(isAvailable, isSelected),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              "${seat.designation}",
              style: TextStyle(
                color: seats[index] == 0 ? Colors.black54 : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getSeatColor(bool isAvailable, bool isSelected) {
    if (isSelected) return AppColors.brightGreen;
    if (isAvailable) return AppColors.primaryColor;
    return AppColors.darkGrey;
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyles.details.copyWith(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
