import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round_8_mobile_safarni_team3/core/functions/validation.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_button.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_text_form_field.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/presentation/widgets/build_requirments.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/widgets/custom_snack_bar.dart';

class RegistreBody extends StatefulWidget {
  const RegistreBody({
    super.key,
    required this.height,
    required TextEditingController emailController,
    required TextEditingController nameController,
    required TextEditingController passwordController,
    required GlobalKey<FormState> formKey,
  }) : _emailController = emailController,
       _passwordController = passwordController,
       _nameController = nameController,
       _formKey = formKey;

  final double height;
  final TextEditingController _emailController;
  final TextEditingController _nameController;
  final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey;

  @override
  State<RegistreBody> createState() => _RegistreBodyState();
}

class _RegistreBodyState extends State<RegistreBody> {
  bool x = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          CustomSnackBar.showSuccess(context, state.message);
          Navigation.push(context, Routes.verfiy, widget._emailController.text);
        }
        if (state is AuthFailure) {
          CustomSnackBar.showError(context, state.message);
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: widget.height * 0.01),
            CustomTextForm(
              controller: widget._nameController,
              hint: "kneeDue",
              keyboardType: TextInputType.emailAddress,
              prefix: Icon(Icons.person, size: 33, color: AppColors.iconColor),
              validator: validName,
            ),
            SizedBox(height: widget.height * 0.02),
            Text(
              "Email",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: widget.height * 0.01),
            CustomTextForm(
              controller: widget._emailController,
              hint: "kneeDue@untitledui.com",
              keyboardType: TextInputType.emailAddress,
              prefix: Icon(Icons.email, size: 33, color: AppColors.iconColor),
              validator: validEmail,
            ),
            SizedBox(height: widget.height * 0.02),
            Text(
              "Password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: widget.height * 0.01),
            CustomTextForm(
              onChanged: (value) {
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
            SizedBox(height: 8),

            BuildRequirments(
              text: "Must Be At Least 8 Characters",
              isval: widget._passwordController.text.length >= 8,
            ),
            SizedBox(height: 8),
            BuildRequirments(
              text: "Must Contain One Special Character",
              isval: widget._passwordController.text.contains(
                RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
              ),
            ),

            SizedBox(height: widget.height * 0.02),

            CustomButton(
              title: state is AuthLoading ? "signing up...." : "Sign Up",
              onPressed: () async {
                if (widget._formKey.currentState!.validate()) {
                  await context.read<AuthCubit>().register(
                    name: widget._nameController.text,
                    email: widget._emailController.text,
                    password: widget._passwordController.text,
                    conPassword: widget._passwordController.text,
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
