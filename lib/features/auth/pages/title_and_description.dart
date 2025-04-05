import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Login to your account",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: AppColors.blackMain,
            fontSize: 32.sp,
            fontFamily: "GeneralSans",
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "Login to your account",
          style: TextStyle(
            color: AppColors.greyMain,
            fontSize: 16.sp,
            fontFamily: "GeneralSans",
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
