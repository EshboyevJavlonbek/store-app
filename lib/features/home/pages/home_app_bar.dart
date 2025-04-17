import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_button_container.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/home/manager/home_bloc.dart';
import 'package:store_app/features/home/manager/home_events.dart';
import 'package:store_app/features/home/widgets/store_modal_bottom_sheet.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 170.h);
}

class _HomeAppBarState extends State<HomeAppBar> {

  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
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
            onPressed: () => context.push(Routes.notification),
            icon: SvgPicture.asset(
              "assets/icons/notification.svg",
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
                spacing: 8.w,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    width: 281.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade400, width: 1.2),
                    ),
                    child: Row(
                      spacing: 8.w,
                      children: [
                        StoreIconButtonContainer(
                          iconColor: AppColors.greySub,
                          image: "assets/icons/search.svg",
                          callback: () {
                            context.read<HomeBloc>().add(
                              HomeSearch(title: controller.text.trim()),
                            );
                          },
                        ),
                        Expanded(
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              hintText: 'Search for clothes...',
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        StoreIconButtonContainer(
                          image: "assets/icons/microphone.svg",
                          callback: () {},
                          iconColor: AppColors.greySub,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => StoreModalBottomSheet(),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 52.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: AppColors.blackMain,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/filters.svg",
                        width: 20.25.w,
                        height: 18.75.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 36.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 10.w,
                    children: [
                      StoreButtonContainer(title: "All", callback: () {}),
                      StoreButtonContainer(title: "T-shirts", callback: () {}),
                      StoreButtonContainer(title: "Jeans", callback: () {}),
                      StoreButtonContainer(title: "Shoes", callback: () {}),
                      StoreButtonContainer(title: "Hats", callback: () {}),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
