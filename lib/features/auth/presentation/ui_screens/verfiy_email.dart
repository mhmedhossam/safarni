import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:safarni/core/widgets/custom_button.dart';
import 'package:safarni/core/widgets/custom_snack_bar.dart';
import 'package:safarni/features/auth/presentation/cubit/auth_cubit.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/utils/app_colors.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key, required this.email});
  final String email;

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  late Timer _timer;
  int _seconds = 30;
  String otpCode = "";

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _seconds = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        timer.cancel();
      } else {
        setState(() => _seconds--);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigation.go(context, Routes.forgetPassword),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            CustomSnackBar.showSuccess(context, state.message);
            Navigation.go(context, Routes.login);
          } else if (state is AuthFailure) {
            CustomSnackBar.showError(context, state.message);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Gap(20),
                const Icon(Icons.email_outlined, size: 40),
                const Gap(16),
                const Text(
                  "Verify Code",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Gap(8),
                Text(
                  "Enter the code sent to\n${widget.email}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.greyColor),
                ),
                const Gap(24),
                Text(
                  "00:${_seconds.toString().padLeft(2, '0')}",
                  style: const TextStyle(fontSize: 18),
                ),
                const Gap(24),
                PinCodeTextField(
                  length: 4,
                  appContext: context,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => otpCode = value,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(12),
                    fieldHeight: 55,
                    fieldWidth: 55,
                    activeColor: AppColors.primaryColor,
                    selectedColor: AppColors.primaryColor,
                    inactiveColor: AppColors.primaryColor,
                  ),
                ),
                const Gap(20),
                state is AuthLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        title: "Verify",
                        onPressed: () {
                          if (otpCode.length == 4) {
                            context.read<AuthCubit>().verify(
                              email: widget.email,
                              code: otpCode,
                            );
                          }
                        },
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
