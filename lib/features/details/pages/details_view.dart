import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  bool isLike = false;
  String selectedSize = "S";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "Details",
        actions: [
          StoreIconButtonContainer(
            image: "assets/icons/notification.svg",
            callback: () => context.push(Routes.notification),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/splash.png',
                          width: double.infinity.w,
                          height: 368.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 16,
                        top: 16,
                        child: StoreIconButtonContainer(
                          containerWidth: 48,
                          containerHeight: 48,
                          iconColor: isLike ? Colors.red : AppColors.blackMain,
                          image: "assets/icons/${isLike ? "heart_filled" : "heart"}.svg",
                          iconHeight: 23,
                          iconWidth: 20,
                          callback: () {
                              setState(() {isLike = !isLike;});
                          },
                          borderRadius: BorderRadius.circular(11.29),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Regular Fit Slogan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            SizedBox(width: 4),
                            Text(
                              "4.0/5 (45 reviews)",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 16),
                        Text("Choose size",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: ["S", "M", "L"].map((size) {
                        final isSelected = selectedSize == size;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(size),
                            selected: isSelected,
                            onSelected: (_) {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            selectedColor: Colors.black,
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "\$1,190",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_bag),
                      label: Text("Add to Cart"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.w, vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
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
