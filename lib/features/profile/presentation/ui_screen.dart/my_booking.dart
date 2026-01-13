import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/utils/text_styles.dart';
import 'package:safarni/features/flight_booking/data/model/search_flight_model.dart';
import 'package:safarni/features/flight_booking/presentation/widgets/select_flight_card.dart';

class MyBookingView extends StatefulWidget {
  const MyBookingView({super.key});

  @override
  State<MyBookingView> createState() => _MyBookingViewState();
}

class _MyBookingViewState extends State<MyBookingView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_sharp),
        ),
        title: Text(
          "My Booking",
          style: TextStyles.details.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFF111928),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Gap(12),

          /// Categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                _categoryItem(Icons.flight_takeoff, "Flight", 0),
                _categoryItem(Icons.directions_car_filled_outlined, "Cars", 1),
                _categoryItem(Icons.tour, "Tours", 2),
                _categoryItem(Icons.hotel, "Hotel", 3),
              ],
            ),
          ),

          const Gap(16),

          /// Content
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _categoryItem(IconData icon, String title, int index) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFEBF5FF) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Color(0xFFEBF5FF) : Color(0xffE5E7EB),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Color(0xFF1E40AF) : Color(0xff111928),
              size: 18,
            ),
            const Gap(6),
            Text(
              title,
              style: TextStyles.details.copyWith(
                color: isSelected ? Color(0xFF1E40AF) : Color(0xff111928),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (selectedIndex) {
      case 0:
        return _flightUI();
      case 1:
        return _carsUI();
      case 2:
        return _toursUI();
      case 3:
        return _hotelUI();
      default:
        return const SizedBox();
    }
  }

  /// Flight UI
  Widget _flightUI() {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return SelectFlightCard(
          model: SearchFlightModelData(),
          isSelected: true,
        );
      },
    );
  }

  /// Cars UI
  Widget _carsUI() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 125,

          child: Stack(
            children: [
              Positioned(
                left: 16,
                top: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "S 500 Sedan",
                      style: TextStyles.details.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const Gap(12),
                    SizedBox(
                      height: 30,
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Automatic ",
                            style: TextStyles.details.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                          Spacer(),
                          VerticalDivider(
                            // Using VerticalDivider instead of HorizontalDivider
                            color: Colors.grey,
                            thickness: 1,
                            endIndent: 3,
                            indent: 3,
                            width: 20, // Adjust width as needed
                          ),
                          Text(
                            "5 seats ",
                            style: TextStyles.details.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                          Spacer(),

                          VerticalDivider(
                            // Another VerticalDivider here if needed
                            color: Colors.grey,
                            thickness: 1,
                            endIndent: 3,
                            indent: 3,
                            width: 20,
                          ),
                          Text(
                            "Diesel",
                            style: TextStyles.details.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(8),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                bottom: 17,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  height: 125,
                  width: 203,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/car_1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    // return Center(
    //   child: Card(
    //     margin: const EdgeInsets.all(16),
    //     child: ListTile(
    //       leading: const Icon(Icons.directions_car),
    //       title: const Text("S 500 Sedan"),
    //       subtitle: const Text("Automatic • 5 seats • Diesel"),
    //       trailing: const Text("\$500"),
    //     ),
    //   ),
    // );
  }

  /// Tours UI
  Widget _toursUI() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return null;

        //   return NearbyHotelCard(onTap: () {});
      },
    );
  }

  /// Hotel UI
  Widget _hotelUI() {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return null;
      }, //NearbyHotelCard(onTap: () {}),
    );
  }
}
