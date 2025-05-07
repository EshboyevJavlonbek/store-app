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
      builder: (context, state) {
        if (state.status == NotificationStatus.success) {
          return Scaffold(
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
            body: state.notifications.isEmpty
                ? StoreNullBody(
                    image: "assets/icons/no_notification.svg",
                    title: "You haven’t gotten any notifications yet!",
                    subTitle: "We’ll alert you when something cool happens.",
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 1.h),
                    itemCount: state.notifications.length,
                    itemBuilder: (context, index) => NotificationItem(
                      image: state.notifications[index].icon,
                      title: state.notifications[index].title,
                      content: state.notifications[index].content,
                    ),
                  ),
            bottomNavigationBar: StoreBottomNavigationBar(),
          );
        }
        else if (state.status == NotificationStatus.loading) {
          return Center(child: CircularProgressIndicator());
        }else if (state.status == NotificationStatus.idle) {
          return StoreNullBody(
            image: "assets/icons/no_notification.svg",
            title: "You haven’t gotten any notifications yet!",
            subTitle: "We’ll alert you when something cool happens.",
          );
        }else  {
          return Center(child: Text("Xatooooo"));
        }
      },
    );
  }
}
