import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/functions/validation.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/widgets/custom_button.dart';
import 'package:safarni/core/widgets/custom_text_form_field.dart';
import 'package:safarni/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safarni/features/auth/presentation/widgets/build_requirments.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/widgets/custom_snack_bar.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key, required this.height});
  final double height;

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> slideAnimation;
  late Animation<Offset> slideAnimation2;
  late Animation<Offset> slideAnimation3;
  late Animation<Offset> slideAnimation4;
  late Animation<double> fadeAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    slideAnimation = Tween<Offset>(begin: Offset(0.1, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.1, 0.4),
          ),
        );
    slideAnimation2 = Tween<Offset>(begin: Offset(0.1, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.2, 0.6),
          ),
        );
    slideAnimation3 = Tween<Offset>(begin: Offset(0.1, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.3, 0.8),
          ),
        );
    slideAnimation4 = Tween<Offset>(begin: Offset(0, 0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _animationController, curve: Interval(0, 1)),
        );
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.8, curve: Curves.easeIn),
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          CustomSnackBar.showSuccess(context, state.message);
          Navigation.push(context, Routes.verify, cubit.emailController.text);
        }
        if (state is AuthFailure) {
          CustomSnackBar.showError(context, state.message);
        }
      },
      builder: (context, state) {
        return FadeTransition(
          opacity: fadeAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(widget.height * 0.01),
              SlideTransition(
                position: slideAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "name",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CustomTextForm(
                      controller: cubit.nameController,
                      hint: "kneeDue",
                      keyboardType: TextInputType.emailAddress,
                      prefix: Icon(
                        Icons.person,
                        size: 33,
                        color: AppColors.iconColor,
                      ),
                      validator: validName,
                    ),
                  ],
                ),
              ),
              Gap(widget.height * 0.01),

              SlideTransition(
                position: slideAnimation2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    CustomTextForm(
                      controller: cubit.emailController,
                      hint: "kneeDue@untitledui.com",
                      keyboardType: TextInputType.emailAddress,
                      prefix: Icon(
                        Icons.email,
                        size: 33,
                        color: AppColors.iconColor,
                      ),
                      validator: validEmail,
                    ),
                  ],
                ),
              ),

              Gap(widget.height * 0.01),
              SlideTransition(
                position: slideAnimation3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "password",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CustomTextForm(
                      onChanged: (value) {
                        cubit.mustValidate(value);
                      },
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
                  ],
                ),
              ),
              Gap(8),

              BuildRequirements(
                text: "Must Be At Least 8 Characters",
                isVal: cubit.x,
              ),
              Gap(8),
              BuildRequirements(
                text: "Must Contain One Special Character",
                isVal: cubit.y,
              ),

              Gap(widget.height * 0.02),

              SlideTransition(
                position: slideAnimation4,
                child: CustomButton(
                  title: state is AuthLoading ? "signing up...." : "Sign Up",
                  onPressed: () async {
                    if (cubit.formKey.currentState!.validate()) {
                      await cubit.register(
                        name: cubit.nameController.text,
                        email: cubit.emailController.text,
                        password: cubit.passwordController.text,
                        conPassword: cubit.passwordController.text,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
