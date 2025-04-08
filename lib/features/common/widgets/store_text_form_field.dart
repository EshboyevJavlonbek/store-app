import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class StoreTextFormField extends StatelessWidget {
  const StoreTextFormField({
    super.key,
    required this.validator,
    required this.title,
    required this.hintText,
    required this.controller,
    this.autoValidateMode = AutovalidateMode.onUnfocus,
    required this.isValid,
  });

  final String title, hintText;
  final TextEditingController controller;

  final String? Function(String? value) validator;

  final bool? isValid;
  final AutovalidateMode autoValidateMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.blackMain,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 0,
          ),
        ),
        SizedBox(
          width: 341.w,
          child: TextFormField(
            controller: controller,
            autovalidateMode: autoValidateMode,
            validator: validator,
            style: TextStyle(
              color: AppColors.blackMain,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.grey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                height: 1.h,
              ),
              suffixIconConstraints: BoxConstraints.loose(
                Size(
                  double.infinity,
                  double.infinity,
                ),
              ),
              suffixIcon: Visibility.maintain(
                visible: isValid != null ? true : false,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: SvgPicture.asset("StoreAppAssets/icons/validation_${isValid != null && isValid! ? 'success' : 'error'}.svg",
                  width: 20.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: isValid != null && isValid! ? Colors.green : AppColors.greySub,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 2,
                  color: isValid != null && isValid! ? Colors.green : AppColors.greySub,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
