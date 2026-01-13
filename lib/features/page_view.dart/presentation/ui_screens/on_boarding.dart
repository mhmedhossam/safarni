import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_button.dart';
import 'package:round_8_mobile_safarni_team3/features/page_view.dart/presentation/widgets/on__boarding__header.dart';
import 'package:round_8_mobile_safarni_team3/features/page_view.dart/presentation/widgets/smoth_indicator.dart';
import 'package:round_8_mobile_safarni_team3/generated/assets.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/utils/app_colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final CarouselSliderController _pageViewConttroller =
      CarouselSliderController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      Assets.imagesPv1,
      Assets.imagesPv2,
      Assets.imagesPv3,
    ];
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    Assets.imagesOnBoarding,
                    fit: BoxFit.cover,
                    width: width,
                  ),
                  //header
                  OnBoardingHeader(currentIndex: currentIndex),
                  SizedBox(height: 20),
                  //sliders
                  Positioned(
                    top: height * 0.12,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: height * 0.50,
                      child: Center(
                        child: CarouselSlider(
                          controller: _pageViewConttroller,
                          items: images
                              .map(
                                (e) => Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: AssetImage(e),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                            enlargeFactor: 0.4,
                            height: height * 0.50,
                            aspectRatio: 16 / 9,
                            autoPlayAnimationDuration: Duration(seconds: 2),
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 10),
              SmothIndicator(currentIndex: currentIndex, images: images),
              SizedBox(height: 20),
              currentIndex == 0
                  ? Text(
                      textAlign: TextAlign.center,
                      "Find Your Dream Adventure\n Here",
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : currentIndex == 1
                  ? Text(
                      textAlign: TextAlign.center,

                      "Easily save your favorite\n  journeys",
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : Text(
                      textAlign: TextAlign.center,
                      "Plan Your Dream Trip With\n TripMate",
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomButton(
                  backgroundColor: AppColors.primaryColor,
                  title: currentIndex != 2 ? "Next" : "Get Start",
                  onPressed: () {
                    if (currentIndex != 2) {
                      setState(() {
                        currentIndex++;
                      });
                      _pageViewConttroller.nextPage();
                    } else if (currentIndex == 2) {
                      setState(() {
                        Navigation.go(context, Routes.welcom);
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
