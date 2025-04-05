import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class StoreIconButtonContainer extends StatelessWidget {
  const StoreIconButtonContainer({
    super.key,
    required this.image,
    this.containerColor = AppColors.white,
    this.containerWidth = 24,
    this.containerHeight = 24,
    this.iconWidth = 18.75,
    this.iconHeight = 15.75,
    this.iconColor = AppColors.blackMain,
    required this.callback,
  });

  final String image;
  final double iconWidth, iconHeight,containerWidth, containerHeight;
  final Color iconColor, containerColor;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth.w,
      height: containerHeight.h,
      color: containerColor,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: callback,
        icon: SvgPicture.asset(
          image,
          width: iconWidth.w,
          height: iconHeight.h,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            iconColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
