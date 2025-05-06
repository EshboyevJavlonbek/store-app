import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreButtonContainer extends StatelessWidget {
  const StoreButtonContainer({
    super.key,
    required this.title,
    required this.callback,
    this.width,
    this.height,
    this.textColor = AppColors.blackMain,
    this.buttonColor = AppColors.white,
    this.icon,
  });

  final String title;
  final VoidCallback callback;
  final double? width, height;
  final Color textColor, buttonColor;
  final String? icon; // Optional SVG icon path

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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              SvgPicture.asset(
                icon!,
                height: 20.h, // Adjust size as needed
                width: 20.w,  // Adjust size as needed
              ),
              SizedBox(width: 8.w), // Space between icon and text
            ],
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
