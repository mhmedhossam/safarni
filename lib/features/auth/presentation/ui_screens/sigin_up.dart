import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/presentation/widgets/footer.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/presentation/widgets/header_login.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/presentation/widgets/row_divider.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/presentation/widgets/social_l_accounts.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../widgets/registre_body.dart';

class SiginUp extends StatefulWidget {
  const SiginUp({super.key});

  @override
  State<SiginUp> createState() => _SiginUpState();
}

class _SiginUpState extends State<SiginUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(height * 0.02),

                  HeaderLogin(width: width, height: height),
                  Gap(height * 0.01),
                  RegistreBody(
                    nameController: _nameController,
                    height: height,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    formKey: _formKey,
                  ),
                  Gap(height * 0.03),
                  RowDivider(),
                  Gap(height * 0.02),
                  SocialLAccounts(height: height),
                  Gap(height * 0.02),
                  Footer(
                    infoText: "Have an account",
                    text: "Log In",
                    onPressed: () {
                      Navigation.go(context, Routes.login);
                    },
                  ),
                  Gap(height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
