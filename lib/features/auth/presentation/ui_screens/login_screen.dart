import 'package:flutter/material.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/routes.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/presentation/widgets/footer.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/presentation/widgets/header_login.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/presentation/widgets/login_body.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/presentation/widgets/row_divider.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/presentation/widgets/social_l_accounts.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../generated/assets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigation.go(context, Routes.welcom);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    Assets.imagesLogo,
                    width: width * 0.4,
                    height: height * 0.10,
                  ),
                ),
                HeaderLogin(width: width, height: height),
                SizedBox(height: height * 0.01),
                LoginBody(
                  height: height,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  formKey: _formKey,
                ),
                SizedBox(height: height * 0.03),
                RowDivider(),
                SizedBox(height: height * 0.02),
                SocialLAccounts(height: height),
                SizedBox(height: height * 0.02),

                Footer(
                  onPressed: () {
                    Navigation.push(context, Routes.siginUp);
                  },
                ),

                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
