import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/functions/validation.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/widgets/custom_button.dart';
import 'package:safarni/core/widgets/custom_snack_bar.dart';
import 'package:safarni/core/widgets/custom_text_form_field.dart';
import 'package:safarni/features/auth/presentation/cubit/auth_cubit.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key, required this.height});

  final double height;

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> with TickerProviderStateMixin {
  late AnimationController _animation2Controller;
  late Animation<Offset> slideAnimation;
  late Animation<Offset> slideAnimation2;
  late Animation<Offset> slideAnimation3;
  late Animation<double> fadeAnimation;
  @override
  void initState() {
    _animation2Controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    slideAnimation = Tween<Offset>(begin: Offset(0.1, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animation2Controller,
            curve: Interval(0.1, 0.4),
          ),
        );
    slideAnimation2 = Tween<Offset>(begin: Offset(0.1, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animation2Controller,
            curve: Interval(0.2, 0.6),
          ),
        );

    slideAnimation3 = Tween<Offset>(begin: Offset(0, 0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _animation2Controller, curve: Interval(0, 1)),
        );
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animation2Controller,
        curve: Interval(0, 0.8, curve: Curves.easeIn),
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animation2Controller.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    _animation2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigation.pop(context);
          CustomSnackBar.showSuccess(context, state.message);
          Navigation.go(context, Routes.mainNavigationScreen);
        } else if (state is AuthFailure) {
          Navigation.pop(context);

          CustomSnackBar.showError(context, state.message);
        } else {
          showDialog(
            context: context,
            builder: (_) {
              return Center(child: CircularProgressIndicator());
            },
          );
        }
      },
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailTransition(
              slideAnimation: slideAnimation,
              widget: widget,
              cubit: cubit,
            ),

            Gap(widget.height * 0.02),
            passwordTransition(
              slideAnimation2: slideAnimation2,
              widget: widget,
              cubit: cubit,
            ),

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
            Gap(widget.height * 0.02),

            SlideTransition(
              position: slideAnimation3,
              child: CustomButton(
                title: "Log In",
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.login(
                      email: cubit.emailController.text.trim(),
                      password: cubit.passwordController.text.trim(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailTransition extends StatelessWidget {
  const EmailTransition({
    super.key,
    required this.slideAnimation,
    required this.widget,
    required this.cubit,
  });

  final Animation<Offset> slideAnimation;
  final LoginBody widget;
  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            "Email",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Gap(widget.height * 0.01),
          CustomTextForm(
            controller: cubit.emailController,
            hint: "kneeDue@untitledui.com",
            keyboardType: TextInputType.emailAddress,
            prefix: Icon(Icons.email, size: 33, color: AppColors.iconColor),
            validator: validEmail,
          ),
        ],
      ),
    );
  }
}

class passwordTransition extends StatelessWidget {
  const passwordTransition({
    super.key,
    required this.slideAnimation2,
    required this.widget,
    required this.cubit,
  });

  final Animation<Offset> slideAnimation2;
  final LoginBody widget;
  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            "Password",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Gap(widget.height * 0.01),
          CustomTextForm(
            controller: cubit.passwordController,
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
          Gap(widget.height * 0.01),
        ],
      ),
    );
  }
}
