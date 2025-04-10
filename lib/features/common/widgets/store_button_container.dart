import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';

class StoreButtonContainer extends StatelessWidget {
  const StoreButtonContainer({
    super.key,
    required this.title,
    required this.callback,
    this.width,
    this.height,
    this.textColor = AppColors.blackMain,
    this.buttonColor = AppColors.white,
  });

  final String title;
  final VoidCallback callback;
  final double? width, height;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppColors.grey),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
