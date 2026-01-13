import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/widgets/custom_appbar.dart';
import 'package:safarni/features/car_booking/presentation/widgets/book_car_widget/brand_card_widget.dart';
import 'package:safarni/generated/assets.dart';
import '../../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../widgets/book_car_widget/car_card_widget.dart';

class CarBookingScreen extends StatelessWidget {
  CarBookingScreen({super.key});

  final List<Map<String, String>> cars = [
    {
      "name": "S 500 Sedan",
      "type": "Automatic",
      "seats": "5 seats",
      "fuel": "Diesel",
    },
    {
      "name": "GLA 250 SUV",
      "type": "Automatic",
      "seats": "7 seats",
      "fuel": "Diesel",
    },
    {
      "name": "Volvo XC40",
      "type": "Automatic",
      "seats": "5 seats",
      "fuel": "Petrol",
    },
    {"name": "BMW M4", "type": "Manual", "seats": "4 seats", "fuel": "Petrol"},
  ];
  final List<Map<String, String>> brands = [
    {"name": "Mercedes", "icon": Assets.imagesMercedes, "count": "+32"},
    {"name": "BMW", "icon": Assets.imagesBmw, "count": "+12"},
    {"name": "Renault", "icon": Assets.imagesRenault, "count": "+8"},
    {"name": "Porsche", "icon": Assets.imagesMercedes, "count": "+5"},
    {"name": "Audi", "icon": Assets.imagesMercedes, "count": "+15"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: CustomAppBar(title: 'Book a Car'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search ...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              ClipRRect(
                child: Image.asset(
                  Assets.imagesCar1,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(10),
              const Text(
                "Brands",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              SizedBox(
                height: 95, // ارتفاع الحاوية ليتناسب مع حجم الكارد
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: brands.length,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, index) {
                    return BrandCardWidget(
                      name: brands[index]["name"]!,
                      icon: brands[index]["icon"]!,
                      count: brands[index]["count"]!,
                      onTap: () {
                        //log("Selected Brand: ${brands[index]["name"]}");
                      },
                    );
                  },
                ),
              ),
              const Gap(20),
              const Text(
                "Popular Cars",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: cars.length,
                // padding: const EdgeInsets.only(bottom: 10),
                itemBuilder: (context, index) {
                  return CarCardWidget(
                    name: cars[index]["name"]!,
                    type: cars[index]["type"]!,
                    seats: cars[index]["seats"]!,
                    fuel: cars[index]["fuel"]!,
                    onRentPressed: () {
                      Navigation.push(context, Routes.carDetailScreen);
                    },
                    onDetailPressed: () {
                      Navigation.push(context, Routes.carDetailScreen);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
