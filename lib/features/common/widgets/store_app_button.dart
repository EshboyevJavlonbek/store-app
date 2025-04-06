import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';

class StoreAppButton extends StatelessWidget {
  const StoreAppButton({
    super.key,
    required this.text,
    this.containerWidth = 341,
    this.containerHeight = 54,
    this.textSize = 16,
    this.textWeight = FontWeight.w500,
    this.containerColor = AppColors.greySub,
    this.textColor = AppColors.white,
    required this.callback,
  });

  final String text;
  final double containerWidth, containerHeight, textSize;
  final FontWeight textWeight;
  final Color containerColor, textColor;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        width: containerWidth.w,
        height: containerHeight.h,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: textSize.sp,
            fontWeight: textWeight,
          ),
        ),
      ),
    );
  }
}
