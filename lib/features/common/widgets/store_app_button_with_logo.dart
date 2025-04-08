import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreAppButtonWithLogo extends StatelessWidget {
  const StoreAppButtonWithLogo({
    super.key,
    required this.image,
    required this.title,
    required this.padding,
    required this.callback,
    this.containerWidth = 341,
    this.containerHeight = 56,
    this.iconWidth = 24,
    this.iconHeight = 24,
    this.titleSize = 16,
    required this.containerColor,
    required this.borderColor,
    required this.titleColor,
    this.titleWeight = FontWeight.w500,
  });

  final String image, title;
  final EdgeInsetsGeometry padding;
  final VoidCallback callback;
  final double containerWidth, containerHeight;
  final double iconWidth, iconHeight, titleSize;
  final Color containerColor, borderColor, titleColor;
  final FontWeight titleWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: padding,
        alignment: Alignment.center,
        width: containerWidth.w,
        height: containerHeight.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1.w,
          ),
          color: containerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          spacing: 5.w,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: iconWidth.w,
              height: iconHeight.h,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontSize: titleSize.sp,
                fontWeight: titleWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
