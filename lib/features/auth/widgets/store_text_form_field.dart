import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';

class StoreTextFormField extends StatelessWidget {
  StoreTextFormField({
    super.key,
    required this.validator,
    required this.title,
    required this.hintText,
    required this.controller,
  });

  final focusNode = FocusNode();
  final String title, hintText;
  final TextEditingController controller;

  final String? Function(String? value) validator;

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
            focusNode: focusNode,
            onTapOutside: (event) => focusNode.unfocus(),
            validator: validator,
            style: TextStyle(
              color: AppColors.blackMain,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColors.grey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.h,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.whiteSub,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
      ],
    );
  }
}
