import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/colors.dart';

class StoreTextButton extends StatelessWidget {
  const StoreTextButton({
    super.key,
    required this.children,
    required this.text,
    this.textSize = 14,
    this.textColor = AppColors.blackMain,
    this.textFontWeight = FontWeight.w400,
  });

  final List<InlineSpan> children;
  final String text;
  final double textSize;
  final Color textColor;
  final FontWeight textFontWeight;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: textColor,
          fontSize: textSize.r,
          fontWeight: textFontWeight,
        ),
        children: children,
      ),
    );
  }
}
