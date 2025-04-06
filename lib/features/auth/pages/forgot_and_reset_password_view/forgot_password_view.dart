import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/auth/widgets/store_text_form_field.dart';
import 'package:store_app/features/auth/widgets/title_and_description.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: '',
        actions: [],
      ),
      extendBody: true,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 1.h),
        children: [
          TitleAndDescription(
            title: "Forgot Password",
            desc:
                "Enter your email for the verification process. We will send 4 digits code to your email.",
          ),
          SizedBox(height: 24.h),
          StoreTextFormField(
            validator: (value) => null,
            title: "Email",
            hintText: "Enter your email",
            controller: TextEditingController(),
          ),
          SizedBox(height: 140.h),
          StoreAppButton(
            containerWidth: 341.w,
            containerHeight: 54.h,
            text: 'Send Code',
            containerColor: AppColors.blackMain,
            callback: () => context.push(Routes.verificationCode),
          ),
        ],
      ),
    );
  }
}
