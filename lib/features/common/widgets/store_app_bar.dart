import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';

class StoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StoreAppBar({
    super.key,
    this.centerTitle = true,
    required this.title,
    this.toolbarHeight = 65,
    this.bottom,
    required this.actions,
  });

  final bool centerTitle;
  final String title;
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;

  @override
  Size get preferredSize {
    final double? bottomHeight = bottom?.preferredSize.height;
    final height =
        bottomHeight == null ? toolbarHeight : bottomHeight + toolbarHeight;
    return Size(double.infinity, height);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 24.w,
      ),
      child: AppBar(
        toolbarHeight: toolbarHeight,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: StoreIconButtonContainer(
            image: "StoreAppAssets/icons/back-arrow.svg",
            callback: () => context.pop(),
          ),
        ),
        centerTitle: centerTitle,
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.blackMain,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: actions,
        bottom: bottom,
      ),
    );
  }
}
