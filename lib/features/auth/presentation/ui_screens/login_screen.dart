import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/constants/routes.dart';
import 'package:safarni/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safarni/features/auth/presentation/widgets/footer.dart';
import 'package:safarni/features/auth/presentation/widgets/header_login.dart';
import 'package:safarni/features/auth/presentation/widgets/login_body.dart';
import 'package:safarni/features/auth/presentation/widgets/row_divider.dart';
import 'package:safarni/features/auth/presentation/widgets/social_l_accounts.dart';

import '../../../../core/constants/navigation.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
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
                  HeaderLogin(width: width, height: height),
                  Gap(height * 0.01),
                  LoginBody(height: height),
                  Gap(height * 0.03),
                  RowDivider(),
                  Gap(height * 0.02),
                  SocialLAccounts(height: height, social: Social.signIn),
                  Gap(height * 0.02),

                  Footer(
                    onPressed: () {
                      Navigation.push(context, Routes.siginUp);
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
