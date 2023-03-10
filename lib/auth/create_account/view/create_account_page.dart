import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progect_management_app/auth/create_account/cubit/create_account_cubit.dart';
import 'package:progect_management_app/auth/login/view/login_page.dart';
import 'package:progect_management_app/l10n/l10n.dart';
import 'package:progect_management_app/theme/theme.dart';
import 'package:progect_management_app/widgets/custom_textfield.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAccountCubit(),
      child: const _CreateAccountView(),
    );
  }
}

class _CreateAccountView extends StatelessWidget {
  const _CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final height = MediaQuery.of(context).viewPadding.top;
    final devSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
              left: devSize.width * .06,
              right: devSize.width * .06,
              top: height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  l10n.tellUsText,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: Colors.black),
                ),
                Text(
                  l10n.letsHelp,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  l10n.firstName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                    hintText: l10n.firstNameExample,
                    textInputType: TextInputType.name,
                    onValueChanged: (value) {
                      context.read<CreateAccountCubit>().onFirstNameChanged =
                          value;
                    }),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  l10n.lastName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                    hintText: l10n.lastNameExample,
                    textInputType: TextInputType.name,
                    onValueChanged: (value) {
                      context.read<CreateAccountCubit>().onLastNameChanged =
                          value;
                    }),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  l10n.email,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                    hintText: l10n.emailNameExample,
                    textInputType: TextInputType.emailAddress,
                    onValueChanged: (value) {
                      context.read<CreateAccountCubit>().onEmailChanged = value;
                    }),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  l10n.password,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  hintText: l10n.passwordExample,
                  textInputType: TextInputType.visiblePassword,
                  onValueChanged: (value) {
                    context.read<CreateAccountCubit>().onPasswordChanged =
                        value;
                  },
                  isPassword: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(l10n.createAccount),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.alreadyHaveText,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 14,
                          ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        );
                      },
                      child: Text(
                        l10n.logIn,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: 14, color: kBlueColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
