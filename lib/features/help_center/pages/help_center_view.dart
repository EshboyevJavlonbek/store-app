import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/help_center/widgets/help_center_item.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "Help Center",
        actions: [
          StoreIconButtonContainer(
            image: "assets/icons/notification.svg",
            callback: () => context.push(Routes.notification),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 25.h),
          child: Divider(color: AppColors.whiteSub),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          spacing: 15.w,
          children: [
            HelpCenterItem(
              image: 'assets/icons/headphones.svg',
              title: 'Customer Service',
              iconWidth: 20.25.w,
              iconHeight: 21.75.h,
              callback: () {},
            ),
            HelpCenterItem(
              image: 'assets/icons/whatsapp.svg',
              title: 'Whatsapp',
              iconWidth: 20.25.w,
              iconHeight: 20.24.h,
              callback: () {},
            ),
            HelpCenterItem(
              image: 'assets/icons/website.svg',
              title: 'Website',
              iconWidth: 20.25.w,
              iconHeight: 17.25.h,
              callback: () {},
            ),
            HelpCenterItem(
              image: 'assets/icons/facebook.svg',
              title: 'Facebook',
              iconWidth: 20.25.w,
              iconHeight: 20.25.h,
              callback: () {},
            ),
            HelpCenterItem(
              image: 'assets/icons/twitter.svg',
              title: 'Twitter',
              iconWidth: 21.w,
              iconHeight: 18.75.h,
              callback: () {},
            ),
            HelpCenterItem(
              image: 'assets/icons/instagram.svg',
              title: 'Instagram',
              iconWidth: 20.25.w,
              iconHeight: 20.25.h,
              callback: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
