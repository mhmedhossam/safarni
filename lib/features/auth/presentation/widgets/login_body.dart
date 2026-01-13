import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round_8_mobile_safarni_team3/core/functions/validation.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_button.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_snack_bar.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_text_form_field.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/presentation/controller/cubit/auth_cubit.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
    required this.height,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required GlobalKey<FormState> formKey,
  }) : _emailController = emailController,
       _passwordController = passwordController,
       _formKey = formKey;

  final double height;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          CustomSnackBar.showSuccess(context, state.message);
          Navigation.go(context, Routes.mainNavigationScreen);
        } else if (state is AuthFailure) {
          CustomSnackBar.showError(context, state.message);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Email",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: height * 0.01),
          CustomTextForm(
            controller: _emailController,
            hint: "kneeDue@untitledui.com",
            keyboardType: TextInputType.emailAddress,
            prefix: Icon(Icons.email, size: 33, color: AppColors.iconColor),
            validator: validEmail,
          ),
          SizedBox(height: height * 0.02),
          const Text(
            "Password",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: height * 0.01),
          CustomTextForm(
            controller: _passwordController,
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
          SizedBox(height: height * 0.01),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
              onPressed: () {
                Navigation.push(context, Routes.forgetPassword);
              },
            ),
          ),
          SizedBox(height: height * 0.02),

          CustomButton(
            title: "Log In",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthCubit>().login(
                  email: _emailController.text.trim(),
                  password: _passwordController.text.trim(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
