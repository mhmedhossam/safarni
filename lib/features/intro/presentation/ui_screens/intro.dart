import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/services/local/shared_pref.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/utils/text_styles.dart';
import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../../../../generated/assets.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with TickerProviderStateMixin {
  late AnimationController _controllerLogo;
  late AnimationController _controllerLetter;
  late AnimationController _controllerDetails;
  late Animation<double> details;

  late Animation<double> sa;
  late Animation<double> fa;
  late Animation<double> r;
  late Animation<double> ni;

  late List<Animation<double>> animationLetters = [sa, fa, r, ni];
  List<String> letters = ["sa", "fa", "r", "ni"];
  late Animation<double> opacity;

  @override
  void initState() {
    _controllerDetails = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    details = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controllerDetails, curve: Curves.bounceIn),
    );
    _controllerLogo = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _controllerLetter = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    sa = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerLetter,
        curve: Interval(0, 0.25, curve: Curves.easeInOut),
      ),
    );
    fa = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerLetter,
        curve: Interval(0.25, 0.50, curve: Curves.easeInOut),
      ),
    );

    r = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerLetter,
        curve: Interval(0.50, 0.75, curve: Curves.easeInOut),
      ),
    );

    ni = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerLetter,
        curve: Interval(0.75, 1, curve: Curves.easeInOut),
      ),
    );

    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerLogo,
        curve: Interval(0, 1, curve: Curves.easeInOut),
      ),
    );

    _controllerLogo.forward();

    _controllerLogo.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerLetter.forward();
      }
    });

    _controllerLetter.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerDetails.forward();
      }
    });
    _controllerDetails.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        navigateNext();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerLogo.dispose();
    _controllerLetter.dispose();
    _controllerDetails.dispose();

    super.dispose();
  }

  void navigateNext() {
    String? token = SharedPref.getToken();
    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      Navigation.pushReplacement(context, Routes.mainNavigationScreen);
    } else {
      Navigation.pushReplacement(context, Routes.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SplashBody(
        width: width,
        height: height,
        opacity: opacity,
        letters: letters,
        animationLetters: animationLetters,
        details: details,
      ),
    );
  }
}

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
    required this.width,
    required this.height,
    required this.opacity,
    required this.letters,
    required this.animationLetters,
    required this.details,
  });

  final double width;
  final double height;
  final Animation<double> opacity;
  final List<String> letters;
  final List<Animation<double>> animationLetters;
  final Animation<double> details;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FadeTransition(
                opacity: opacity,
                child: Image.asset(Assets.imagesLogo),
              ),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(letters.length, (i) {
                  return FadeTransition(
                    opacity: animationLetters[i],
                    child: Text(letters[i], style: TextStyles.header),
                  );
                }),
              ),
              FadeTransition(
                opacity: details,
                child: Text(
                  "Let's Travel..",
                  style: TextStyles.title.copyWith(color: AppColors.blackColor),
                ),
              ),
              Gap(80),
            ],
          ),
        ),
      ],
    );
  }
}
