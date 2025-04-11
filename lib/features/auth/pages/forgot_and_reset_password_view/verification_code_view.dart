import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/auth/manager/verification/verification_bloc.dart';
import 'package:store_app/features/auth/manager/verification/verification_state.dart';
import 'package:store_app/features/common/widgets/title_and_description.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';

import '../../../../core/routing/routes.dart';
import '../../../common/widgets/store_app_button.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({super.key, required this.email});

  final String email;

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  final pinController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String errorText = "";
  String buttonText = "Continue";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationBloc, VerificationState>(
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
                  title: "Enter 4 Digit Code",
                  desc:
                      "Enter 4 digit code that your receive on your email (${widget.email})."),
              SizedBox(height: 24.h),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    PinCodeTextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: pinController,
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
                    Text(
                      errorText,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
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
                text: buttonText,
                containerColor: AppColors.blackMain,
                callback: () {
                  if (formKey.currentState!.validate()) {
                    context.read<VerificationBloc>().add(
                          VerificationRequested(
                            email: widget.email,
                            code: pinController.text,
                          ),
                        );
                    if (state.status == VerificationStatus.loading) {
                      buttonText = "Loading...";
                      setState(() {});
                    } else if (state.status == VerificationStatus.error) {
                      errorText = "Code is not correct.";
                      setState(() {});
                    }else  {
                      context.push(Routes.resetPass, extra: {
                        "email": widget.email,
                        "code": pinController.text,
                      });
                    }
                  } else {
                    errorText = "Code is not complete.";
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
