import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class HelpCenterItem extends StatelessWidget {
  const HelpCenterItem({
    super.key,
    required this.image,
    required this.title,
    required this.iconWidth,
    required this.iconHeight,
    required this.callback,
  });

  final String image, title;
  final double iconWidth, iconHeight;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        width: 341.w,
        height: 52.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.whiteSub,
            width: 1,
          ),
        ),
        child: Row(
          spacing: 15.w,
          children: [
            SvgPicture.asset(
              image,
              width: iconWidth,
              height: iconHeight,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: TextStyle(
                color: AppColors.blackMain,
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
