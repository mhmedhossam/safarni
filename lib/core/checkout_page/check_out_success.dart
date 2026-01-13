import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/constants/navigation.dart';
import 'package:safarni/core/constants/routes.dart';
import 'package:safarni/core/utils/text_styles.dart';
import 'package:safarni/core/widgets/custom_appbar.dart';
import 'package:safarni/core/widgets/custom_button.dart';
import 'package:safarni/generated/assets.dart';

class CheckOutSuccess extends StatelessWidget {
  const CheckOutSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ""),

      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset(Assets.successfullyPayment),
            Gap(30),
            Text("Payment Successful", style: TextStyles.header),
            Gap(10),

            Text("Thank you for your trust", style: TextStyles.details),
            Gap(30),

            CustomButton(
              title: "Back To Home",
              onPressed: () {
                Navigation.go(context, Routes.mainNavigationScreen);
              },
            ),
            Gap(80),
          ],
        ),
      ),
    );
  }
}
