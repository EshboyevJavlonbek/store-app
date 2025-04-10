import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';

class StoreBottomNavigationBar extends StatelessWidget {
  const StoreBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
      width: double.infinity,
      height: 86.h,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            width: 0.5.w,
            color: AppColors.greySub,
          ),
        ),
      ),
      child: SizedBox(
        width: 342.w,
        height: 41.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 42.h,
              child: Column(
                children: [
                  StoreIconButtonContainer(
                    image: "StoreAppAssets/icons/home.svg",
                    callback: () {},
                    iconColor: AppColors.grey,
                    iconWidth: 18.75.w,
                    iconHeight: 19.5.h,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 42.h,
              child: Column(
                children: [
                  StoreIconButtonContainer(
                    image: "StoreAppAssets/icons/search.svg",
                    callback: () {},
                    iconColor: AppColors.grey,
                    iconWidth: 20.27.w,
                    iconHeight: 20.27.h,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 42.h,
              child: Column(
                children: [
                  StoreIconButtonContainer(
                    image: "StoreAppAssets/icons/heart.svg",
                    callback: () {},
                    iconColor: AppColors.grey,
                    iconWidth: 21.75.w,
                    iconHeight: 18.75.h,
                  ),
                  Text(
                    "Saved",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 42.h,
              child: Column(
                children: [
                  StoreIconButtonContainer(
                    image: "StoreAppAssets/icons/cart.svg",
                    callback: () {},
                    iconColor: AppColors.grey,
                    iconWidth: 22.13.w,
                    iconHeight: 20.25.h,
                  ),
                  Text(
                    "Cart",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 42.h,
              child: Column(
                children: [
                  StoreIconButtonContainer(
                    image: "StoreAppAssets/icons/profile.svg",
                    callback: () {},
                    iconColor: AppColors.grey,
                    iconWidth: 20.25.w,
                    iconHeight: 20.25.h,
                  ),
                  Text(
                    "Account",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
