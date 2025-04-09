import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({
    super.key,
  });
  @override
  Size get preferredSize => Size(double.infinity, 170.h);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:24.w),
      child: AppBar(
        toolbarHeight: 91.h,
        title: Row(
          children: [
            Text(
              "Discover",
              style: TextStyle(
                color: AppColors.blackMain,
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "StoreAppAssets/icons/notification.svg",
              width: 18.75.w,
              height: 20.25.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 98.h),
          child: Column(
            spacing: 8.h,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 281.w,
                    height: 52.h,
                    child: TextFormField(
                      cursorColor: AppColors.blackMain,
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 1,
                              color: AppColors.grey,
                            )),
                        hintText: "Search for clothes...",
                        hintStyle: TextStyle(
                          color: AppColors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 1,
                            color: AppColors.greySub,
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 20.27.h,
                          maxWidth: 20.27.w,
                        ),
                        prefixIcon: SvgPicture.asset(
                          "StoreAppAssets/icons/search.svg",
                          colorFilter:
                              ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                          width: 20.27.w,
                          height: 20.27.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 60.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: AppColors.grey)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
