import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/widgets/custom_button.dart';
import 'package:safarni/features/page_view.dart/presentation/widgets/on__boarding__header.dart';
import 'package:safarni/features/page_view.dart/presentation/widgets/smoth_indicator.dart';
import 'package:safarni/generated/assets.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/utils/app_colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  final CarouselSliderController _pageViewConttroller =
      CarouselSliderController();
  int currentIndex = 0;
  List<String> texts = [
    "Find Your Dream Adventure\n Here",
    "Easily save your favorite\n  journeys",
    "Plan Your Dream Trip With\n TripMate",
  ];
  List<String> images = [Assets.imagesPv1, Assets.imagesPv2, Assets.imagesPv3];
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
    super.initState();
  }

  void _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
    _animationController
      ..reset()
      ..forward();
    return;
  }

  void _onNextPressed() {
    if (currentIndex != 2) {
      _pageViewConttroller.nextPage();
      _animationController.reset();
    } else if (currentIndex == 2) {
      Navigation.go(context, Routes.welcom);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  Gap(20),
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
                            onPageChanged: (index, reason) =>
                                _onPageChanged(index),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SmothIndicator(currentIndex: currentIndex, images: images),
              Gap(20),

              FadeTransition(
                opacity: animation,
                child: Text(
                  texts[currentIndex],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomButton(
                  backgroundColor: AppColors.primaryColor,
                  title: currentIndex != 2 ? "Next" : "Get Start",
                  onPressed: () {
                    _onNextPressed();
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
