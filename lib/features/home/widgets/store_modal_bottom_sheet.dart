import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/home/widgets/filters_item.dart';
import 'package:store_app/features/common/widgets/store_button_container.dart';
import 'package:store_app/features/home/widgets/store_drop_down_button.dart';

class StoreModalBottomSheet extends StatelessWidget {
  const StoreModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
      width: double.infinity,
      height: 405.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        spacing: 7.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filters",
                style: TextStyle(
                  color: AppColors.blackMain,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: SvgPicture.asset(
                  "StoreAppAssets/icons/x.svg",
                  width: 15.76.w,
                  height: 15.76.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Divider(color: AppColors.greySub),
          Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FiltersItem(title: "Sort By", subTitle: ""),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10.w,
                  children: [
                    StoreButtonContainer(title: "Relevance", callback: () {}),
                    StoreButtonContainer(
                        title: "Price: Low - High", callback: () {}),
                    StoreButtonContainer(
                        title: "Price: High - Low", callback: () {}),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: AppColors.greySub),
          Column(
            spacing: 10.h,
            children: [
              FiltersItem(title: "Price", subTitle: "\$ 0 - \$ 19"),
              Container(
                width: double.infinity,
                height: 20,
                color: AppColors.blackMain,
              ),
            ],
          ),
          Divider(color: AppColors.greySub),
          SizedBox(
            height: 22.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Size",
                  style: TextStyle(
                    color: AppColors.blackMain,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                StoreDropDownButton(),
              ],
            ),
          ),
          StoreButtonContainer(
            title: "Apply Filters",
            callback: () {},
            width: 341.w,
            height: 54.h,
            buttonColor: AppColors.blackMain,
            textColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}
