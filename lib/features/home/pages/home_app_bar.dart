import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_button_container.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/home/manager/home_bloc.dart';
import 'package:store_app/features/home/manager/home_events.dart';
import 'package:store_app/features/home/widgets/store_modal_bottom_sheet.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({
    super.key,
  });

  final controller = TextEditingController();

  @override
  Size get preferredSize => Size(double.infinity, 170.h);

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
                spacing: 8.w,
                children: [
                  SizedBox(
                    width: 281.w,
                    height: 52.h,
                    child: TextFormField(
                      cursorColor: AppColors.blackMain,
                      controller: controller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 1,
                            color: AppColors.grey,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 14.h),
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
                          maxWidth: double.infinity,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: StoreIconButtonContainer(
                            image: "StoreAppAssets/icons/search.svg",
                            callback: (){
                              context.read<HomeBloc>().add(HomeSearch(title: controller.text));
                            },
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "StoreAppAssets/icons/microphone.svg",
                          ),
                        ),
                      ),
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
                        "StoreAppAssets/icons/filters.svg",
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
