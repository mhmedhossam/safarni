import 'package:flutter/material.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/text_styles.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  DateSelectorState createState() => DateSelectorState();
}

class DateSelectorState extends State<DateSelector> {
  String? selectedCheckIn;
  String? selectedCheckOut;

  void selectCheckIn(String date) {
    setState(() {
      selectedCheckIn = date;
    });
  }

  void selectCheckOut(String date) {
    setState(() {
      selectedCheckOut = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Check In",
          style: TextStyles.details.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFF111928),
          ),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DateCard(
                day: "Today",
                date: "4 Oct",
                isSelected: selectedCheckIn == "4 Oct",
                onTap: () => selectCheckIn("4 Oct"),
              ),
              DateCard(
                day: "Tomorrow",
                date: "5 Oct",
                isSelected: selectedCheckIn == "5 Oct",
                onTap: () => selectCheckIn("5 Oct"),
              ),
              DateCard(
                day: "Next Day",
                date: "6 Oct",
                isSelected: selectedCheckIn == "6 Oct",
                onTap: () => selectCheckIn("6 Oct"),
              ),
              DateCard(
                day: "Next Week",
                date: "11 Oct",
                isSelected: selectedCheckIn == "11 Oct",
                onTap: () => selectCheckIn("11 Oct"),
              ),
              // Add more DateCards as needed
            ],
          ),
        ),
        SizedBox(height: 16),
        Text(
          "Check Out",
          style: TextStyles.details.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFF111928),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DateCard(
                day: "Today",
                date: "4 Oct",
                isSelected: selectedCheckOut == "4 Oct",
                onTap: () => selectCheckOut("4 Oct"),
              ),
              DateCard(
                day: "Today",
                date: "5 Oct",
                isSelected: selectedCheckOut == "5 Oct",
                onTap: () => selectCheckOut("5 Oct"),
              ),
              DateCard(
                day: "Today",
                date: "6 Oct",
                isSelected: selectedCheckOut == "6 Oct",
                onTap: () => selectCheckOut("6 Oct"),
              ),
              DateCard(
                day: "Today",
                date: "7 Oct",
                isSelected: selectedCheckOut == "7 Oct",
                onTap: () => selectCheckOut("7 Oct"),
              ),

              // Add more DateCards as needed
            ],
          ),
        ),
      ],
    );
  }
}

class DateCard extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;
  final VoidCallback onTap;

  const DateCard({
    super.key,
    required this.day,
    required this.date,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff1E429F) : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Text(
              day,
              style: TextStyles.details.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
            Text(
              date,
              style: TextStyles.details.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
