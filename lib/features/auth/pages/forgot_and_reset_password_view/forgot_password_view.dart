import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/auth/manager/forgot_password/forgot_password_bloc.dart';
import 'package:store_app/features/auth/manager/forgot_password/forgot_password_state.dart';
import 'package:store_app/features/common/widgets/store_text_form_field.dart';
import 'package:store_app/features/common/widgets/title_and_description.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool? emailValid;
  String errorMassage = "This field is required.";
  String buttonText = 'Send Code';

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: '',
        actions: [],
      ),
      extendBody: true,
      body: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: Column(
            children: [
              TitleAndDescription(
                title: "Forgot Password",
                desc:
                    "Enter your email for the verification process. We will send 4 digits code to your email.",
              ),
              SizedBox(height: 24.h),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    StoreTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          emailValid = false;
                          setState(() {});
                          return errorMassage;
                        }
                        final emailRegex = RegExp(
                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                        if (!emailRegex.hasMatch(value)) {
                          emailValid = false;
                          setState(() {});
                          return "Enter a valid email address.";
                        }
                        emailValid = true;
                        setState(() {});
                        return null;
                      },
                      title: "Email",
                      hintText: "Enter your email",
                      controller: emailController,
                      isValid: emailValid,
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              StoreAppButton(
                containerWidth: 341.w,
                containerHeight: 54.h,
                text: buttonText,
                containerColor: AppColors.blackMain,
                callback: () {
                  if (formKey.currentState!.validate()) {
                    context.read<ForgotPasswordBloc>().add(
                        ForgotPasswordRequested(email: emailController.text));
                    if (state.status == ForgotPasswordStatus.error) {
                      errorMassage = state.errorMessage!;
                      setState(() {});
                    } else if (state.status == ForgotPasswordStatus.loading) {
                      buttonText == "Loading...";
                      setState(() {});
                    } else {
                      context.push(Routes.verificationCode, extra: emailController.text);
                    }
                  } else {
                    errorMassage = "Email is not correct.";
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
