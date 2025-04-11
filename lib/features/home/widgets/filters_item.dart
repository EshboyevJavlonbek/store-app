import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';

class FiltersItem extends StatelessWidget {
  const FiltersItem({
    super.key, required this.title, required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.blackMain,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            color: AppColors.greyMain,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
