import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/widgets/custom_back_button.dart';
import 'package:safarni/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safarni/features/auth/presentation/widgets/footer.dart';
import 'package:safarni/features/auth/presentation/widgets/header_login.dart';
import 'package:safarni/features/auth/presentation/widgets/row_divider.dart';
import 'package:safarni/features/auth/presentation/widgets/social_l_accounts.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../widgets/registre_body.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(height * 0.02),

                  HeaderLogin(width: width, height: height),
                  Gap(height * 0.01),
                  RegisterBody(height: height),
                  Gap(height * 0.03),
                  RowDivider(),
                  Gap(height * 0.02),
                  SocialLAccounts(height: height, social: Social.signUp),
                  Gap(height * 0.02),
                  Footer(
                    infoText: "Have an account",
                    text: "Log In",
                    onPressed: () {
                      Navigation.pushReplacement(context, Routes.login);
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
