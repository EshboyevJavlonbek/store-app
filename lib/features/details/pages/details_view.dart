import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/details/maneger/details_bloc.dart';
import 'package:store_app/features/details/maneger/details_state.dart';
import 'package:store_app/features/details/pages/detail_bottom_navigation_bar.dart';
import 'package:store_app/features/details/widgets/detail_to_review.dart';
import 'package:store_app/features/details/widgets/product_images.dart';

import '../../common/widgets/store_button_container.dart';
import '../../common/widgets/store_icon_button_container.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  int selectedSize = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailState>(
      builder: (context, state) {
        if (state.status == DetailStatus.loading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state.status == DetailStatus.error) {
          return const Scaffold(
            body: Center(child: Text("Xatolik yuz berdi")),
          );
        } else if (state.status == DetailStatus.success &&
            state.detail != null) {
          bool isValid = state.detail!.isLiked;
          return Scaffold(
            appBar: StoreAppBar(
              title: "Details",
              actions: [
                StoreIconButtonContainer(
                  image: 'assets/icons/notification.svg',
                  callback: () => context.push(Routes.notification),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 341.w,
                    height: 368.h,
                    child: Stack(
                      children: [
                        ProductImages(detail: state.detail),
                        Positioned(
                          top: 12.h,
                          left: 290.w,
                          child: StoreIconButtonContainer(
                            image:
                                "assets/icons/${isValid ? 'heart_filled' : 'heart'}.svg",
                            iconColor:
                                isValid ? Colors.red : AppColors.blackMain,
                            callback: () {
                              setState(() {
                                isValid = !isValid;
                              });

                              if (isValid) {
                                context.read<DetailsBloc>().add(
                                    DetailSaveProduct(
                                        productId: state.detail!.id));
                              } else {
                                context.read<DetailsBloc>().add(
                                    DetailUnSaveProduct(
                                        productId: state.detail!.id));
                              }
                            },
                            containerWidth: 34.w,
                            containerHeight: 34.h,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.greyMain,
                                offset: Offset(0.w, 8.h),
                                blurRadius: 10,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    state.detail!.title,
                    style: TextStyle(
                      fontFamily: "General Sans",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  DetailToReview(
                    detail: state.detail,
                  ),
                  Text(
                    state.detail!.description,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontFamily: "General Sans",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Choose size",
                    style: TextStyle(
                      color: AppColors.blackMain,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "General Sans",
                    ),
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    height: 50.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.sizes.length,
                      itemBuilder: (context, index) => Row(
                        children: [
                          StoreButtonContainer(
                            width: 50.h,
                            title: state.sizes[index].title,
                            callback: () {
                              setState(() {
                                selectedSize = index;
                              });
                            },
                            textColor: selectedSize == index
                                ? AppColors.white
                                : AppColors.blackMain,
                            buttonColor: selectedSize == index
                                ? AppColors.blackMain
                                : AppColors.white,
                          ),
                          SizedBox(width: 10.h,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: DetailBottomNavigationBar(
              selectedSize: selectedSize,
              product: state.detail,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
