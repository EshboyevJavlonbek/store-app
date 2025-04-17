import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/colors.dart';
import '../../common/widgets/store_icon_button_container.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  bool isOngoingSelected = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        extendBody: true,
        appBar: StoreAppBar(
          title: "My Orders",
          actions: [
            StoreIconButtonContainer(
              image: 'assets/icons/notification.svg',
              callback: () => context.push(Routes.myCart),
              iconWidth: 14,
              iconHeight: 19,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(341.w, 88.h),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: AppColors.whiteSub,
                borderRadius: BorderRadius.circular(11),
              ),
              padding: EdgeInsets.all(11),
              child: TabBar(
                onTap: (index) {
                  setState(() {
                    isOngoingSelected = index == 0;
                  });
                },
                indicator: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                indicatorColor: Colors.transparent,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  Tab(
                    child: Container(
                      height: 44.h,
                      alignment: Alignment.center,
                      child: Text(
                        'Ongoing',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: isOngoingSelected
                              ? AppColors.blackMain
                              : AppColors.grey,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 44.h,
                      alignment: Alignment.center,
                      child: Text(
                        'Completed',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: !isOngoingSelected
                              ? AppColors.blackMain
                              : AppColors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrderCard("In Transit"),
            _buildOrderCard("Delivered"),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard(String status) {
    Color statusBgColor;
    Color statusTextColor;

    if (status == "In Transit") {
      statusBgColor = Colors.grey.shade300;
      statusTextColor = Colors.black;
    } else if (status == "Delivered") {
      statusBgColor = Colors.green.shade100;
      statusTextColor = Colors.green.shade800;
    } else {
      statusBgColor = Colors.grey.shade300;
      statusTextColor = Colors.black;
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 16.h),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.whiteSub),
            ),
            padding: EdgeInsets.all(12.w),
            child: Row(
              children: [
                Container(
                  width: 80.w,
                  height: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/splash.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Regular Fit Slogan",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "Size M",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.blackMain.withValues(alpha: 0.6),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ 1,190",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackMain,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "Track Order",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: statusBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: statusTextColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

