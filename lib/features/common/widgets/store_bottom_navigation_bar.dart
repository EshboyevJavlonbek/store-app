import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';

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
              child: GestureDetector(
                onTap: () => context.go(Routes.home),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/home.svg",
                      width: 18.75.w,
                      height: 19.5.h,
                      fit: BoxFit.cover,
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
            ),
            SizedBox(
              height: 42.h,
              child: GestureDetector(
                onTap: () => context.push(Routes.search),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/search.svg",
                      width: 20.75.w,
                      height: 20.75.h,
                      fit: BoxFit.cover,
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
            ),
            SizedBox(
              height: 42.h,
              child: GestureDetector(
                onTap: () => context.push(Routes.savedItems),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/heart.svg",
                      width: 21.75.w,
                      height: 18.75.h,
                      colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                      fit: BoxFit.cover,
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
            ),
            SizedBox(
              height: 42.h,
              child: GestureDetector(
                onTap: () => context.push(Routes.myCart),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/cart.svg",
                      width: 22.13.w,
                      height: 20.25.h,
                      fit: BoxFit.cover,
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
            ),
            SizedBox(
              height: 42.h,
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/profile.svg",
                      width: 20.25.w,
                      height: 20.25.h,
                      fit: BoxFit.cover,
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
            ),
          ],
        ),
      ),
    );
  }
}
