import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:intl/intl.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.date,
  });

  final String image, title, subTitle;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd,MM,yyyy').format(date);
    String formattedTime = DateFormat('hh:mm:ss').format(date);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: Column(
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
                      subTitle,
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
              Text(
                '$formattedDate at $formattedTime',
                style: TextStyle(
                  color: AppColors.blackMain,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),

            ],
          ),
          Divider(
            color: AppColors.whiteSub,
          ),
        ],
      ),
    );
  }
}
