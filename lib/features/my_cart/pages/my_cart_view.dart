import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';

import '../../common/widgets/store_null_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "My Cart",
        actions: [
          StoreIconButtonContainer(
            image: "assets/icons/notification.svg",
            callback: () => context.push(Routes.notification),
          ),
        ],
      ),
      extendBody: true,
      body: StoreNullBody(
        image: "assets/icons/cart.svg",
        title: "Your Cart Is Empty!",
        subTitle: "When you add products, they’ll appear here.",
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}

// ListView(
// padding: EdgeInsets.symmetric(horizontal: 24.w),
// children: [
// Container(
// padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
// width: 342.w,
// height: 107.h,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(10),
// border: Border.all(
// color: AppColors.whiteSub,
// width: 1.w,
// ),
// ),
// child: Row(
// spacing: 10.w,
// children: [
// ClipRRect(
// borderRadius: BorderRadius.circular(4),
// child: Image.asset(
// "assets/images/splash.png",
// width: 83.w,
// height: 79.h,
// fit: BoxFit.cover,
// ),
// ),
// SizedBox(
// width: 213.w,
// height: 79.h,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// "Regular Fit Slogan",
// style: TextStyle(
// color: AppColors.blackMain,
// fontSize: 14.sp,
// fontWeight: FontWeight.w600,
// ),
// ),
// StoreIconButtonContainer(
// image: "assets/icons/trash.svg",
// iconColor: Colors.red,
// callback: () {},
// ),
// ],
// ),
// Text(
// "Size L",
// style: TextStyle(
// color: AppColors.grey,
// fontSize: 12.sp,
// fontWeight: FontWeight.w400,
// ),
// ),
// Spacer(),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// "\$ 1,190",
// style: TextStyle(
// color: AppColors.blackMain,
// fontSize: 16.sp,
// fontWeight: FontWeight.w600,
// ),
// ),
// SizedBox(
// width: 72.5.w,
// height: 22.37.h,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// StoreIconButtonContainer(
// image: "assets/icons/trash.scg",
// callback: () {},
// ),
// Text(
// "2",
// style: TextStyle(
// color: AppColors.blackMain,
// fontSize: 12.sp,
// fontWeight: FontWeight.w500,
// ),
// ),
// StoreIconButtonContainer(
// image: "assets/icons/trash.scg",
// callback: () {},
// ),
// ],
// ),
// ),
// ],
// )
// ],
// ),
// )
// ],
// ),
// ),
// ],
// )
