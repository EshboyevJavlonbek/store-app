import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/common/widgets/store_null_body.dart';
import 'package:store_app/features/notification/manager/notification_bloc.dart';
import 'package:store_app/features/notification/manager/notification_state.dart';
import 'package:store_app/features/notification/widgets/notification_item.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) => Scaffold(
        appBar: StoreAppBar(
          title: "Notifications",
          actions: [SvgPicture.asset("assets/icons/notification.svg")],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 24.h),
            child: Divider(
              color: AppColors.whiteSub,
            ),
          ),
        ),
        extendBody: true,
        body: SafeArea(
          child: state.notifications.isEmpty
              ? StoreNullBody(
                  image: "assets/icons/no_notification.svg",
                  title: "You haven’t gotten any notifications yet!",
                  subTitle: "We’ll alert you when something cool happens.",
                )
              : ListView.builder(
                  itemCount: state.notifications.length,
                  itemBuilder: (context, index) => NotificationItem(
                    image: state.notifications[index].image,
                    title: state.notifications[index].title,
                    subTitle: state.notifications[index].subTitle,
                  ),
                ),
        ),
        bottomNavigationBar: StoreBottomNavigationBar(),
      ),
    );
  }
}
