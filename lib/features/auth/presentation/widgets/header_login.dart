import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/generated/assets.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({
    super.key,
    required this.width,
    required this.height,
    this.image,
  });

  final double width;
  final double height;
  final Image? image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Center(
            child: Image.asset(
              Assets.imagesLogo,
              width: width * 0.4,
              height: height * 0.10,
            ),
          ),
          Gap(height * 0.015),
          Text(
            textAlign: TextAlign.center,
            "Welcome",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Gap(height * 0.01),

          Text(
            textAlign: TextAlign.center,
            "welcome back! please fill your Data",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
