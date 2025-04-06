import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';

class OrItem extends StatelessWidget {
  const OrItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      children: [
        Container(
          width: 154,
          height: 1,
          color: AppColors.greySub,
        ),
        Text(
          "Or",
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          width: 154,
          height: 1,
          color: AppColors.greySub,
        ),
      ],
    );
  }
}
