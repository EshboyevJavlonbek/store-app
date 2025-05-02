import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/check/login_check.dart';
import 'package:store_app/features/auth/pages/store_text_button.dart';
import 'package:store_app/features/auth/widgets/or_item.dart';
import 'package:store_app/features/common/widgets/store_app_button_with_logo.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/colors.dart';
import '../../common/widgets/store_app_button.dart';
import '../../common/widgets/store_password_field.dart';
import '../../common/widgets/store_text_form_field.dart';
import '../../common/widgets/title_and_description.dart';
import '../manager/login/login_bloc.dart';
import '../manager/login/login_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();

    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.success) {
            context.go(Routes.home);
          } else if (state.status == LoginStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? "Ishlamadi!")),
            );
          }
        },
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.only(
              top: 59.h,
              left: 24.w,
              right: 24.w,
              bottom: 1.h,
            ),
            children: [
              TitleAndDescription(
                title: "Login to your account",
                desc: "It’s great to see you again.",
              ),
              SizedBox(height: 20.h),
              Form(
                key: formKey,
                child: Column(
                  spacing: 16.h,
                  children: [
                    StoreTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          bloc.emailValid = false;
                          setState(() {});
                          return "This field is required.";
                        }
                        final emailRegex =
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value)) {
                          bloc.emailValid = false;
                          setState(() {});
                          return "Enter a valid email address.";
                        }
                        bloc.emailValid = true;
                        setState(() {});
                        return null;
                      },
                      title: "Email",
                      hintText: "Enter your email address",
                      controller: emailController,
                      isValid: bloc.emailValid,
                    ),
                    StorePasswordField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          bloc.passwordValid = false;
                          setState(() {});
                          return "This field is required.";
                        }
                        bloc.passwordValid = true;
                        setState(() {});
                        return null;
                      },
                      title: "Password",
                      hintText: "Enter your password",
                      controller: passwordController,
                      isValid: bloc.passwordValid,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              StoreTextButton(
                text: "Forgot your password? ",
                children: [
                  TextSpan(
                    text: "Reset your password",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.push(Routes.forgotPass),
                    style: TextStyle(
                      color: AppColors.blackMain,
                      fontSize: 14.r,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 27.h),
              StoreAppButton(
                text: 'Login',
                containerColor: bloc.getBackgroundColor(),
                callback: () async{
                  if (formKey.currentState!.validate()) {
                    bloc.add(
                      LoginRequested(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                    await LoginCheck.saveLoginStatus(true);
                  }
                },
              ),
              SizedBox(height: 24.h),
              OrItem(),
              SizedBox(height: 24.h),
              StoreAppButtonWithLogo(
                image: "assets/icons/google_logo.svg",
                title: "Login with Google",
                padding: EdgeInsets.symmetric(horizontal: 84.w),
                callback: () {},
                containerColor: AppColors.white,
                borderColor: AppColors.greySub,
                titleColor: AppColors.blackMain,
              ),
              SizedBox(height: 16.h),
              StoreAppButtonWithLogo(
                image: "assets/icons/facebook_logo.svg",
                title: "Login with Facebook",
                padding: EdgeInsets.symmetric(horizontal: 71.w),
                callback: () {},
                containerColor: AppColors.blue,
                borderColor: AppColors.blue,
                titleColor: AppColors.white,
              ),
              SizedBox(height: 164.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style:
                        TextStyle(color: AppColors.blackMain, fontSize: 14.r),
                    children: [
                      TextSpan(
                        text: "Join",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.go(Routes.signUp),
                        style: TextStyle(
                          color: AppColors.blackMain,
                          fontSize: 14.r,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
