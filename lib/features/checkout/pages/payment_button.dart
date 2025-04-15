import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
    required this.image,
    required this.title,
    this.color = AppColors.white,
    this.containerWidth = 150,
    this.containerHeight = 36,
    this.iconWith = 21.75,
    this.iconHeight = 15.75,
     this.iconColor = AppColors.blackMain,
     this.titleColor = AppColors.blackMain, required this.callback,
  });

  final String image, title;
  final Color color, iconColor, titleColor;
  final double containerWidth, containerHeight, iconWith, iconHeight;
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
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.whiteSub,
            width: 1.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5.w,
          children: [
            SvgPicture.asset(
              image,
              colorFilter: ColorFilter.mode(
                iconColor,
                BlendMode.srcIn,
              ),
              width: iconWith.w,
              height: iconHeight.h,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
