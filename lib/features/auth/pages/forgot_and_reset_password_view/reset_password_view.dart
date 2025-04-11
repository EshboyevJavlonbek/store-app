import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/auth/manager/reset_password/reset_password_bloc.dart';
import 'package:store_app/features/auth/manager/reset_password/reset_password_state.dart';
import 'package:store_app/features/common/widgets/store_password_field.dart';
import 'package:store_app/features/common/widgets/title_and_description.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key, required this.email, required this.code});

  final String email, code;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  bool? passwordValid, confirmPassValid;
  final formKey = GlobalKey<FormState>();
  String buttonText = "Continue";
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) => Scaffold(
        appBar: StoreAppBar(
          title: '',
          actions: [],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: Column(
            children: [
              TitleAndDescription(
                title: "Reset Password",
                desc:
                    "Set the new password for your account so you can login and access all the features.",
              ),
              SizedBox(height: 24.h),
              Form(
                key: formKey,
                child: Column(
                  spacing: 16.h,
                  children: [
                    StorePasswordField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          passwordValid = false;
                          setState(() {});
                          return "This field is required.";
                        }
                        passwordValid = true;
                        setState(() {});
                        return null;
                      },
                      title: "Password",
                      hintText: "Enter your password",
                      controller: passwordController,
                      isValid: passwordValid,
                    ),
                    StorePasswordField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          passwordValid = false;
                          setState(() {});
                          return "This field is required.";
                        }
                        if (passwordController.text !=
                            confirmPassController.text) {
                          setState(() {});
                          return "Password is not same.";
                        }
                        passwordValid = true;
                        setState(() {});
                        return null;
                      },
                      title: "Confirm Password",
                      hintText: "Enter your password",
                      controller: confirmPassController,
                      isValid: confirmPassValid,
                    ),
                    Text(
                      errorText,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              StoreAppButton(
                text: buttonText,
                callback: () {
                  if (formKey.currentState!.validate()) {
                    context.read<ResetPasswordBloc>().add(
                          ResetPasswordRequest(
                            email: widget.email,
                            code: widget.code,
                            password: passwordController.text,
                          ),
                        );
                    if (state.status == ResetPasswordStatus.error) {
                      buttonText =
                          "The new password must be the same as the old password.";
                    } else if (state.status == ResetPasswordStatus.loading) {
                      buttonText = "Loading...";
                      setState(() {});
                    }
                    else {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => Center(
                          child: Container(
                            padding: EdgeInsets.all(24),
                            width: 341.w,
                            height: 292.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  "StoreAppAssets/icons/dialog_success.svg",
                                  width: 63.38.w,
                                  height: 63.38.h,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  "Password Changed!",
                                  style: TextStyle(
                                    color: AppColors.blackMain,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  "Your can now use your new password to login to your account.",
                                  style: TextStyle(
                                    color: AppColors.blackMain,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                StoreAppButton(
                                  text: "Login",
                                  callback: () => context.go(Routes.login),
                                  containerColor: AppColors.blackMain,
                                  containerWidth: 293.w,
                                  containerHeight: 54.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  } else {
                    buttonText = "Validation is not true.";
                    setState(() {});
                  }
                },
                containerColor: AppColors.blackMain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
