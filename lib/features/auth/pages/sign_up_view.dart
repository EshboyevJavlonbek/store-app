import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/auth/manager/sign_up/sign_up_bloc.dart';
import 'package:store_app/features/auth/pages/sign_up_view_form.dart';
import 'package:store_app/features/auth/widgets/or_item.dart';
import 'package:store_app/features/auth/widgets/store_app_button_with_logo.dart';
import 'package:store_app/features/auth/widgets/title_and_description.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';

import '../../../core/utils/colors.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<SignUpBloc>();
    return ListenableBuilder(
      listenable: vm,
      builder: (BuildContext context, Widget? child) => Scaffold(
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
            SignUpViewForm(vm: vm),
            SizedBox(height: 12.h),
            Text(
              "By signing up you agree to our Terms, Privacy Policy, and Cookie Use",
              maxLines: 2,
              style: TextStyle(
                color: AppColors.blackMain,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 24.h),
            StoreAppButton(
              text: "Create an Account",
              callback: () async {
                final snackBar = SnackBar(
                  content: Text("Ishladi malades!"),
                  duration: Duration(seconds: 2),
                );
                final snackBar2 = SnackBar(
                  content: Text("Ishlamadi!"),
                  duration: Duration(seconds: 2),
                );
                if (await vm.signUp() && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar2);
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
            SizedBox(
              width: 341.w,
              child: Center(
                child: Text(
                  "Already have an account? Log In",
                  maxLines: 2,
                  style: TextStyle(
                    color: AppColors.blackMain,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
