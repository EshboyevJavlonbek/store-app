import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription({
    super.key,
    required this.title,
    required this.desc,
    this.titleFontSize = 32,
    this.descFontSize = 16,
    this.titleFontWeight = FontWeight.w600,
    this.descFontWeight = FontWeight.w400,
    this.titleColor = AppColors.blackMain,
    this.descColor = AppColors.greyMain,
    this.titleLetterSpacing = -1.2,
    this.descLetterSpacing = 0,
    this.titleDecoration = TextDecoration.none,
    this.descDecoration = TextDecoration.none,
  });

  final String title, desc;
  final double titleFontSize, descFontSize;
  final double titleLetterSpacing, descLetterSpacing;
  final TextDecoration titleDecoration, descDecoration;
  final FontWeight titleFontWeight, descFontWeight;
  final Color titleColor, descColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: titleColor,
            fontSize: titleFontSize.sp,
            fontFamily: "GeneralSans",
            fontWeight: titleFontWeight,
            letterSpacing: titleLetterSpacing,
            decoration: titleDecoration,
          ),
        ),
        Text(
          desc,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: descColor,
            fontSize: descFontSize.sp,
            fontFamily: "GeneralSans",
            fontWeight: descFontWeight,
            letterSpacing: descLetterSpacing,
            decoration: descDecoration,
          ),
        ),
      ],
    );
  }
}
