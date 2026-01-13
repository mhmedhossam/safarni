import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/widgets/custom_appbar.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/account_settings_widget.dart';

class SecurityAccount extends StatefulWidget {
  const SecurityAccount({super.key});

  @override
  State<SecurityAccount> createState() => _SecurityAccountState();
}

class _SecurityAccountState extends State<SecurityAccount> {
  bool bioToggle = false;
  bool faceToggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Account & Security"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Biometric ID",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Switch(
                      activeThumbColor: AppColors.primaryColor,
                      value: bioToggle,
                      onChanged: (bool value) {
                        setState(() => bioToggle = value);
                      },
                    ),
                  ],
                ),
                Gap(10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Face ID",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Switch(
                      activeThumbColor: AppColors.primaryColor,
                      value: faceToggle,
                      onChanged: (bool value) {
                        setState(() => faceToggle = value);
                      },
                    ),
                  ],
                ),
                Gap(40),
                AccountSettingsWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
