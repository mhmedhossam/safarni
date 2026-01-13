import 'package:flutter/material.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/routes.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_button.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_snack_bar.dart';
import 'package:round_8_mobile_safarni_team3/features/flight_booking/presentation/widgets/select_flight_card.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../generated/assets.dart';
import '../../data/model/search_flight_model.dart';

class SelectFlightScreen extends StatefulWidget {
  final List<SearchFlightModelData> flights;

const SelectFlightScreen({super.key, required this.flights});

  @override
  State<SelectFlightScreen> createState() => _SelectFlightScreenState();
}

class _SelectFlightScreenState extends State<SelectFlightScreen> {

  int? _selectedFlightIndex;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final bool isEmpty = widget.flights.isEmpty;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.3,
                pinned: true,
                floating: true,
                stretch: true,
                backgroundColor: AppColors.primaryColor,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: AppColors.whiteColor),
                  onPressed: () => Navigator.pop(context),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "Select Your Flight",
                    style: TextStyles.title.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Image.asset(
                    Assets.imagesFlight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              if ( isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: _buildEmptyState(),
                )
              else ...[ SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: _buildDateInfo(
                              "Dec 16th, 2025",
                              Icons.calendar_today,
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: _buildDateInfo(
                              "Jan 6th, 2025",
                              Icons.person_outline,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                  bottom: MediaQuery.of(context).size.height * 0.12,
                ),
                sliver: SliverFixedExtentList(
                  itemExtent: height * 0.22,
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final isSelected = _selectedFlightIndex == index;
                      final flight = widget.flights[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedFlightIndex = index;
                            });
                          },
                          child: SelectFlightCard(
                            model: flight,
                            isSelected: isSelected,
                          ),
                        ),
                      );
                    },
                    childCount: widget.flights.length,
                    addAutomaticKeepAlives: true,
                    addRepaintBoundaries: true,
                  ),
                ),
              ),]
            ],
          ),

          if(!isEmpty)
          Positioned(
            bottom: height * 0.03,
            left: 20,
            right: 20,
            child: CustomButton(
              onPressed: () {
                if (_selectedFlightIndex != null) {
                  final selectedFlight = widget.flights[_selectedFlightIndex!];

                  Navigation.push(
                    context,
                    Routes.seatSelection,
                    {
                  'flight':selectedFlight,
                  'flightId':selectedFlight.id,
                   }
                  );
                } else {
                  CustomSnackBar.showWarning(
                    context,
                    "Please select a flight first",
                  );
                }
              },
              title: "Continue",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.flight_takeoff_outlined, size: 80, color: Colors.grey[300]),
        const SizedBox(height: 20),
        Text(
          "No Flights Found",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800]),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            "We couldn't find any flights for the selected criteria. Please try changing your search details.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600], height: 1.5),
          ),
        ),
        const SizedBox(height: 30),
        TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.search),
          label: const Text("Search Again"),
          style: TextButton.styleFrom(foregroundColor: AppColors.primaryColor),
        )
      ],
    );
  }
  Widget _buildDateInfo(String text, IconData icon) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey[700]),
          SizedBox(width: 10),
          Text(text, style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

