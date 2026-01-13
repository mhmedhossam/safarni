import 'package:flutter/material.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmothIndicator extends StatelessWidget {
  const SmothIndicator({
    super.key,
    required this.currentIndex,
    required this.images,
  });

  final int currentIndex;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: currentIndex,
      count: images.length,
      effect: const ExpandingDotsEffect(
        spacing: 8.0,
        radius: 5.0,
        dotWidth: 10.0,
        dotHeight: 10.0,
        paintStyle: PaintingStyle.stroke,
        strokeWidth: 1.5,
        dotColor: Colors.grey,
        activeDotColor: AppColors.primaryColor,
      ),
    );
  }
}
