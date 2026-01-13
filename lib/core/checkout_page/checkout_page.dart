import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/app_fonts.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/routes.dart';
import 'package:round_8_mobile_safarni_team3/core/functions/validation.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_appbar.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_button.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_text_form_field.dart';
import 'package:round_8_mobile_safarni_team3/generated/assets.dart';

class PaymentChoice {
  final String paymentName;
  final String icon;
  PaymentChoice({required this.icon, required this.paymentName});
}

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final formKey = GlobalKey<FormState>();
  int isSelected = -1;
  List<PaymentChoice> paymentChoice = [
    PaymentChoice(icon: Assets.paypal, paymentName: "Paypal"),
    PaymentChoice(icon: Assets.masterCard1, paymentName: "Master Card"),
    PaymentChoice(icon: Assets.visa, paymentName: "Visa"),
  ];
  List<Widget> payWidgets = [
    PayPalWidget(),

    CustomDetailsCard(),
    CustomDetailsCard(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppBar(title: "Payment Method"),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Your \npayment Method",
                    style: TextStyles.title.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  Gap(30),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: AppColors.linearBlue,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: AppColors.linear,
                          spreadRadius: 2,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 32,
                          left: 22,
                          child: SvgPicture.asset(Assets.chip),
                        ),
                        Positioned(
                          top: 32,
                          right: 24,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(Assets.touch),
                              Gap(5),
                              SvgPicture.asset(Assets.contactless),
                              Gap(5),

                              SvgPicture.asset(Assets.applePay),
                              Gap(5),

                              SvgPicture.asset(Assets.googlePay),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 90,
                          left: 22,
                          child: Text(
                            "**** **** **** 1234",
                            style: TextStyles.header.copyWith(
                              fontFamily: AppFonts.cardString,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 20,
                          left: 26,
                          child: Text(
                            "Abuzer Firdousi",
                            style: TextStyles.title.copyWith(
                              fontFamily: AppFonts.cardString,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 45,
                          left: 25,
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.valid),
                              Gap(10),
                              Text(
                                "01/22",
                                style: TextStyles.title.copyWith(
                                  fontFamily: AppFonts.cardString,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 24,
                          child: SvgPicture.asset(Assets.masterCard),
                        ),
                      ],
                    ),
                  ),
                  Gap(30),

                  SizedBox(
                    height: 56,

                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,

                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            isSelected = i;
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: isSelected == i
                                  ? Color(0xffEBF5FF)
                                  : Colors.grey[100],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(paymentChoice[i].icon),
                                Gap(10),
                                Text(
                                  paymentChoice[i].paymentName,
                                  style: TextStyles.details.copyWith(
                                    fontSize: 14,
                                    color: isSelected == i
                                        ? Color(0xff1E429F)
                                        : Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: paymentChoice.length,
                    ),
                  ),
                  Gap(50),
                  isSelected == -1
                      ? Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            GestureDetector(
                              onTap: () {
                                isSelected = 0;
                                setState(() {});
                              },
                              child: Text("Add Card", style: TextStyles.title),
                            ),
                            Icon(Icons.add),
                          ],
                        )
                      : payWidgets[isSelected],
                  Gap(30),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomButton(
            title: isSelected == -1 ? "continue" : "Confirm Booking",
            onPressed: () {
              if (formKey.currentState!.validate() && isSelected != -1) {
                Navigation.push(context, Routes.checkOutSuccess);
              }
              if (isSelected == -1) {
                isSelected = 0;
                setState(() {});
              }
            },
          ),
        ),
      ),
    );
  }
}

class CustomDetailsCard extends StatelessWidget {
  const CustomDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text("Full Name"),
        Gap(6),
        CustomTextForm(
          hint: "Your full name",
          fillColor: AppColors.whiteColor,
          validator: validName,
        ),
        Gap(16),

        Text("your Email"),
        Gap(6),

        CustomTextForm(
          hint: "Your Email",
          fillColor: AppColors.whiteColor,
          validator: validEmail,
        ),
        Gap(16),

        Row(
          children: [
            Expanded(flex: 2, child: Text("Valid Date")),
            Expanded(flex: 1, child: Text("CVV")),
          ],
        ),
        Gap(6),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: CustomTextForm(
                validator: dateValidator,
                keyboardType: TextInputType.number,
                inputFormatter: [
                  MaskTextInputFormatter(
                    mask: '##-##-####',
                    filter: {"#": RegExp(r'[0-9]')},
                  ),
                ],
                hint: "12-6-2024",
              ),
            ),
            Gap(5),
            Expanded(
              flex: 1,
              child: CustomTextForm(
                hint: "562",
                maxLength: 3,
                keyboardType: TextInputType.number,
                validator: validCvv,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PayPalWidget extends StatelessWidget {
  const PayPalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Full Name"),
        Gap(6),
        CustomTextForm(
          hint: "Your full name",
          validator: validName,
          keyboardType: TextInputType.name,
        ),
        Gap(16),

        Text("Full Email"),
        Gap(6),

        CustomTextForm(hint: "Your Email", validator: validEmail),
      ],
    );
  }
}
