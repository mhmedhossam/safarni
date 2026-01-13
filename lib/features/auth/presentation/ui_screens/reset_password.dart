import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/features/auth/presentation/widgets/r_eset_password_header.dart';
import 'package:safarni/features/auth/presentation/widgets/reset_password_body.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                Gap(height * 0.06),
                REsetPasswordHeader(height: height),
                Gap(height * 0.03),
                ResetPasswordBody(
                  height: height,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                ),
                Gap(height * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
