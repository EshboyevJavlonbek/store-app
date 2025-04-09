import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/auth/manager/sign_up/sign_up_bloc.dart';
import 'package:store_app/features/auth/manager/sign_up/sign_up_state.dart';
import 'package:store_app/features/auth/pages/store_text_button.dart';
import 'package:store_app/features/auth/widgets/or_item.dart';
import 'package:store_app/features/common/widgets/store_app_button_with_logo.dart';
import 'package:store_app/features/common/widgets/title_and_description.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/colors.dart';
import '../../common/widgets/store_password_field.dart';
import '../../common/widgets/store_text_form_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<SignUpBloc>();
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (BuildContext context, state) {
        if (state.status == SignUpStatus.success) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Ishladi malades!")));
        } else if (state.status == SignUpStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? "Xatolik yuz berdi")),
          );
        }
      },
      builder: (context, state) => Scaffold(
        body: ListView(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            top: 59.h,
            bottom: 1.h,
          ),
          children: [
            TitleAndDescription(
              title: "Create an account",
              desc: "Let’s create your account.",
            ),
            SizedBox(height: 20.h),
            Form(
              key: formKey,
              child: Column(
                spacing: 10.h,
                children: [
                  StoreTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        bloc.fullNameValid = false;
                        setState(() {});
                        return "This field is required.";
                      }
                      bloc.fullNameValid = true;
                      setState(() {});
                      return null;
                    },
                    title: "Full Name",
                    hintText: "Enter your full name",
                    controller: fullNameController,
                    isValid: bloc.fullNameValid,
                  ),
                  StoreTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        bloc.emailValid = false;
                        setState(() {});
                        return "This field is required.";
                      }
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
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
              children: [
                TextSpan(
                  text: "Privacy Policy, ",
                  style: TextStyle(
                    color: AppColors.blackMain,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: 'and ',
                  style: TextStyle(
                    color: AppColors.blackMain,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: "Cookie Use",
                  style: TextStyle(
                    color: AppColors.blackMain,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
              text: 'By signing up you agree to our Terms, ',
            ),
            SizedBox(height: 24.h),
            StoreAppButton(
              text: "Create an Account",
              containerColor: bloc.getBackgroundColor(),
              callback: () {
                if (formKey.currentState!.validate()) {
                  bloc.add(
                    SignUpRequested(
                      fullName: fullNameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 24.h),
            OrItem(),
            SizedBox(height: 24.h),
            StoreAppButtonWithLogo(
              image: "StoreAppAssets/icons/google_logo.svg",
              title: "Login with Google",
              padding: EdgeInsets.symmetric(horizontal: 84.w),
              callback: () {},
              containerColor: AppColors.white,
              borderColor: AppColors.greySub,
              titleColor: AppColors.blackMain,
            ),
            SizedBox(height: 10.h),
            StoreAppButtonWithLogo(
              image: "StoreAppAssets/icons/facebook_logo.svg",
              title: "Login with Facebook",
              padding: EdgeInsets.symmetric(horizontal: 77.w),
              callback: () {},
              containerColor: Color(0xFF1877F2),
              borderColor: Color(0xFF1877F2),
              titleColor: AppColors.white,
            ),
            SizedBox(height: 48.h),
            Center(
              child: StoreTextButton(
                children: [
                  TextSpan(
                    text: "Log In",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.push(Routes.login),
                    style: TextStyle(
                      color: AppColors.blackMain,
                      fontSize: 14.r,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
                text: "Already have an account? ",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
