import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/routes.dart';
import 'package:round_8_mobile_safarni_team3/core/functions/validation.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_text_form_field.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/presentation/widgets/resetpassword_footer.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({
    super.key,
    required this.height,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
  }) : _passwordController = passwordController,
       _confirmPasswordController = confirmPasswordController;

  final double height;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Gap(widget.height * 0.01),
          CustomTextForm(
            onChanged: (v) {
              setState(() {});
            },
            controller: widget._passwordController,
            isPassword: true,
            hint: "***********",
            keyboardType: TextInputType.emailAddress,
            prefix: Icon(
              Icons.lock_outline_rounded,
              size: 33,
              color: AppColors.iconColor,
            ),
            validator: validatePassword,
          ),
          Gap(widget.height * 0.02),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Confirm Password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Gap(widget.height * 0.01),
          CustomTextForm(
            controller: widget._confirmPasswordController,
            isPassword: true,
            hint: "***********",
            keyboardType: TextInputType.emailAddress,
            prefix: Icon(
              Icons.lock_outline_rounded,
              size: 33,
              color: AppColors.iconColor,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Confirm Password is required";
              }
              if (value != widget._passwordController.text) {
                return "Passwords do not match";
              }
              return null;
            },
          ),
          Gap(widget.height * 0.02),
          PasswordRequirements(
            is8Char: widget._passwordController.text.length >= 8,
            isSpecialOne: widget._passwordController.text.contains(
              RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
            ),
            onResetPassword: () {
              if (_formKey.currentState!.validate()) {
                Navigation.push(context, Routes.passwordReseted);
              }
            },
            onBackToLogin: () {
              Navigation.go(context, Routes.login);
            },
          ),
        ],
      ),
    );
  }
}
