import 'package:flutter/material.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/text_styles.dart';

import '../../../flight_type_model.dart';

class FlightTypeChips extends StatefulWidget {
  const FlightTypeChips({super.key});

  @override
  State<FlightTypeChips> createState() => _FlightTypeChipsState();
}

class _FlightTypeChipsState extends State<FlightTypeChips> {
  int _selectedIndex = 0;
  final List<TripType> tripOptions = [
    TripType("Round Trip", Icons.sync),
    TripType("Multi City", Icons.sync_problem),
    TripType("One Way", Icons.arrow_forward),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tripOptions.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: _selectedIndex == index
                      ? AppColors.primaryColor
                      : Colors.transparent,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              label: Text(tripOptions[index].label),
              labelStyle: TextStyles.details.copyWith(
                fontSize: 14,
                color: _selectedIndex == index
                    ? AppColors.primaryColor
                    : Colors.black87,
                fontWeight: _selectedIndex == index
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),

              avatar: Icon(
                tripOptions[index].icon,
                size: 18,
                color: _selectedIndex == index
                    ? AppColors.primaryColor
                    : Colors.grey,
              ),
              selected: _selectedIndex == index,
              onSelected: (bool selected) {
                setState(() {
                  _selectedIndex = (selected ? index : _selectedIndex);
                });
              },
              showCheckmark: false,
              selectedColor: AppColors.secondaryColor.withValues(alpha: 0.1),
              backgroundColor: AppColors.lightGrey,
            ),
          );
        }),
      ),
    );
  }
}
