import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/auth/widgets/store_password_field.dart';
import 'package:store_app/features/auth/widgets/title_and_description.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: '',
        actions: [],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 1.h),
        children: [
          TitleAndDescription(
            title: "Reset Password",
            desc:
                "Set the new password for your account so you can login and access all the features.",
          ),
          SizedBox(height: 24.h),
          StorePasswordField(
            validator: (value) => null,
            title: "Password",
            hintText: "Enter your password",
            controller: TextEditingController(),
          ),
          SizedBox(height: 16.h),
          StorePasswordField(
            validator: (value) => null,
            title: "Confirm Password",
            hintText: "Enter your password",
            controller: TextEditingController(),
          ),
          SizedBox(height: 55.h),
          StoreAppButton(
            text: "Continue",
            callback: () {},
            containerColor: AppColors.blackMain,
          ),
        ],
      ),
    );
  }
}
