import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountItem extends StatelessWidget {
  final String image;
  final double imageWidth;
  final double imageHeight;
  final Color? imageColor;

  final String title;
  final Color? titleColor;

  final VoidCallback callback;

  final bool showArrow;

  const AccountItem({
    super.key,
    required this.image,
    required this.imageWidth,
    required this.imageHeight,
    required this.title,
    required this.callback,
    this.imageColor,
    this.titleColor,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w,right: 24.w),
      child: Column(
        children: [
          Row(
            children: [
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  imageColor ?? Colors.black,
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(
                  image,
                  height: imageHeight,
                  width: imageWidth,
                  fit: BoxFit.cover,
                ),
              ),
               SizedBox(width: 9.w),
              Text(
                title,
                style: TextStyle(
                  color: titleColor ?? Colors.black,
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
              ),
              Spacer(),
              if (showArrow)
                GestureDetector(
                  onTap: callback,
                  child: SvgPicture.asset(
                    "assets/icons/right_arrow.svg",
                    height:  24.h,
                    width:  24.w,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
