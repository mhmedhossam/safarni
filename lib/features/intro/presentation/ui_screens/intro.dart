import 'package:flutter/material.dart';
import 'package:round_8_mobile_safarni_team3/core/services/local/shared_pref.dart';
import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../../../../generated/assets.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      // Check if user has token
      final token = SharedPref.getData(SharedPref.ktoken);

      if (!mounted) return;
      if (token != null && token.toString().isNotEmpty) {
        Navigation.pushReplacement(context, Routes.mainNavigationScreen);
      } else {
        Navigation.pushReplacement(context, Routes.onboarding);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                Assets.imagesIntroPage,
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(child: Image.asset(Assets.imagesLogo)),
        ],
      ),
    );
  }
}
