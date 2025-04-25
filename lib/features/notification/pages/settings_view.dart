import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import '../../common/widgets/store_icon_button_container.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final Map<String, bool> _notificationSettings = {
    'General Notifications': true,
    'Sound': true,
    'Vibrate': false,
    'Special Offers': true,
    'Promo & Discounts': false,
    'Payments': false,
    'Cahback': true,
    'App Updates': false,
    'New Service Available': true,
    'New Tips Available': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: StoreAppBar(
        title: "Notifications",
        actions: [
          StoreIconButtonContainer(
            image: 'assets/icons/notification.svg',
            callback: () => context.push(Routes.notification),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 24.h),
          child: Divider(color: AppColors.whiteSub),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              itemCount: _notificationSettings.length,
              separatorBuilder: (_, __) => Divider(
                height: 1,
                thickness: 1,
                indent: 18,
                endIndent: 24,
                color: AppColors.greySub,
              ),
              itemBuilder: (context, index) {
                String key = _notificationSettings.keys.elementAt(index);
                return Padding(
                  padding:  EdgeInsets.symmetric(vertical: 6.h, horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          key,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          value: _notificationSettings[key]!,
                          onChanged: (value) {
                            setState(
                              () {
                                _notificationSettings[key] = value;
                              },
                            );
                          },
                          activeColor: Colors.white,
                          activeTrackColor: Colors.black,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: AppColors.greySub,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
