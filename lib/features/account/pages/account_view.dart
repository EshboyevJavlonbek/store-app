import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';

import '../../../core/routing/routes.dart';
import '../../common/widgets/store_icon_button_container.dart';
import '../widgets/account_item.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: StoreAppBar(
        title: "Account",
        actions: [
          StoreIconButtonContainer(
            image: 'assets/icons/notification.svg',
            callback: () => context.push(Routes.notification),
            iconWidth: 14,
            iconHeight: 19,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: Divider(
            color: AppColors.greyMain,
            thickness: 1,
          ),
        ),
      ),
      body: Column(
        spacing: 8,
        children: [
          AccountItem(
              image: "assets/icons/no_order.svg",
              title: "My Order",
              callback: () {},
              imageWidth: 20,
              imageHeight: 21),
          SizedBox(height: 6),
          Divider(
            color: AppColors.greySub,
            thickness: 6,
          ),
          SizedBox(height: 6),
          AccountItem(
              image: "assets/icons/my_detail.svg",
              title: "My Details",
              callback: () => context.push(Routes.myDetail),
              imageWidth: 23,
              imageHeight: 16),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Divider(color: AppColors.greySub, thickness: 1),
          ),
          SizedBox(height: 6),
          AccountItem(
              image: "assets/icons/home.svg",
              title: "Address Book",
              callback: () {},
              imageWidth: 23,
              imageHeight: 19),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Divider(color: AppColors.greySub, thickness: 1),
          ),
          SizedBox(height: 6),
          AccountItem(
              image: "assets/icons/card.svg",
              title: "Payment Method",
              callback: () {},
              imageWidth: 22,
              imageHeight: 15),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Divider(color: AppColors.greySub, thickness: 1),
          ),
          SizedBox(height: 6),
          AccountItem(
              image: "assets/icons/notification.svg",
              title: "Notifications",
              callback: () => context.push(Routes.settings),
              imageWidth: 18,
              imageHeight: 20),
          SizedBox(height: 6),
          Divider(
            color: AppColors.greySub,
            thickness: 6,
          ),
          SizedBox(height: 6),
          AccountItem(
              image: ("assets/icons/question_mark.svg"),
              title: "FAQs",
              callback: () => context.push(Routes.faqs),
              imageWidth: 20,
              imageHeight: 20),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Divider(color: AppColors.greySub, thickness: 1),
          ),
          SizedBox(height: 6),
          AccountItem(
              image: ("assets/icons/headphones.svg"),
              title: "Help Center",
              callback: () => context.push(Routes.helpCenter),
              imageWidth: 20,
              imageHeight: 21),
          SizedBox(height: 6),
          Divider(
            color: AppColors.greySub,
            thickness: 6,
          ),
          SizedBox(height: 6),
          AccountItem(
            image: "assets/icons/logout.svg",
            title: "Logout",
            titleColor: Colors.red,
            callback: () {},
            imageWidth: 18,
            imageHeight: 18,
            imageColor: Colors.red,
            showArrow: false,
          ),
        ],
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
