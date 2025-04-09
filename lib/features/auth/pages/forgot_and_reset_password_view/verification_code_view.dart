import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/title_and_description.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';

import '../../../../core/routing/routes.dart';
import '../../../common/widgets/store_app_button.dart';

class VerificationCodeView extends StatelessWidget {
   VerificationCodeView({super.key});

  final pinController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: '',
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: Column(
          children: [
            TitleAndDescription(
                title: "Enter 4 Digit Code",
                desc:
                    "Enter 4 digit code that your receive on your email (cody.fisher45@example.com)."),
            SizedBox(height: 24.h),
            PinCodeTextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: pinController,
              key: formKey,
              appContext: context,
              length: 4,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                fieldHeight: 60.h,
                fieldWidth: 64.w,
                borderRadius: BorderRadius.circular(10),
                activeFillColor: AppColors.white,
                // inactiveFillColor: Colors.grey[200]!,
                selectedFillColor: AppColors.white,
                activeColor: AppColors.greySub,
                inactiveColor: AppColors.greySub,
                selectedColor: AppColors.greySub,
              ),
            ),
            Center(
              child: Text(
                "Email not received? Resend code",
                style: TextStyle(
                  color: AppColors.blackMain,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            StoreAppButton(
              containerWidth: 341.w,
              containerHeight: 54.h,
              text: 'Continue',
              containerColor: AppColors.blackMain,
              callback: () => context.push(Routes.resetPass),
            ),
          ],
        ),
      ),
    );
  }
}
