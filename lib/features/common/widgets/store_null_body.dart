import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class StoreNullBody extends StatelessWidget {
  const StoreNullBody({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    image,
                    colorFilter:
                        ColorFilter.mode(AppColors.greySub, BlendMode.srcIn),
                    width: 48.w,
                    height: 52.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: 230.w,
                    height: 30.h,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.blackMain,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: 252.w,
                    height: 44.h,
                    child: Text(
                      subTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.greyMain,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
