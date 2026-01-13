import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/widgets/custom_button.dart';
import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../controller/cubit/auth_cubit.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigation.go(context, Routes.login),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            CustomSnackBar.showSuccess(context, state.message);

            Navigation.push(context, Routes.verify, _emailController.text);
          } else if (state is AuthFailure) {
            CustomSnackBar.showError(context, state.message);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Icon(Icons.key, size: 50, color: AppColors.greyColor),
                    Gap(height * 0.02),
                    const Text(
                      "Forget Password",
                      style: TextStyle(fontSize: 18),
                    ),
                    const Text(
                      "Please enter your email to reset password",
                      style: TextStyle(color: AppColors.greyColor),
                    ),
                    Gap(height * 0.03),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text("Email"),
                    ),
                    CustomTextForm(
                      controller: _emailController,
                      hint: "example@email.com",
                      keyboardType: TextInputType.emailAddress,
                      prefix: const Icon(Icons.email),
                      validator: validEmail,
                    ),
                    Gap(height * 0.03),
                    state is AuthLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            title: "Send Code",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().forgotPassword(
                                  _emailController.text,
                                );
                              }
                            },
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
