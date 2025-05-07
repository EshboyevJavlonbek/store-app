import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.image,
    required this.title,
    required this.content,

  });

  final String image, title, content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.network(
              image,
              width: 24.w,
              height: 24.h,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.blackMain,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    content,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.blackMain,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 37.w, top: 20.h, bottom: 20.h),
          child: Divider(
            color: AppColors.whiteSub,
          ),
        ),

      ],
    );
  }
}
