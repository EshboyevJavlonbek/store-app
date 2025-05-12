import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/data/model/product/product_model.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/home/manager/home_bloc.dart';
import 'package:store_app/features/home/manager/home_events.dart';

import '../../../core/routing/routes.dart';

class HomeProductItem extends StatefulWidget {
  const HomeProductItem({
    super.key,
    required this.model,
  });

  final ProductModel model;

  @override
  State<HomeProductItem> createState() => _HomeProductItemState();
}

class _HomeProductItemState extends State<HomeProductItem> {
  late bool isValid = widget.model.isLiked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 161.w,
      height: 224.h,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => context.push(Routes.getDetail(widget.model.id)),
            child: Container(
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: widget.model.image,
                      width: 200.w,
                      height: 174.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    widget.model.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.blackMain,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        "\$ ${widget.model.price}",
                        style: TextStyle(
                          color: AppColors.greyMain,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      if (widget.model.discount != 0)
                        Text(
                          "-${widget.model.discount}%",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 12.h,
            left: 115.w,
            child: StoreIconButtonContainer(
              image: "assets/icons/${isValid ? 'heart_filled' : 'heart'}.svg",
              iconColor: isValid ? Colors.red : AppColors.blackMain,
              callback: () {
                setState(() {
                  isValid = !isValid;
                });

                if (isValid) {
                  context.read<HomeBloc>().add(HomeSaved(productId: widget.model.id));
                } else {
                  context
                      .read<HomeBloc>()
                      .add(HomeUnSaved(productId: widget.model.id));
                }
              },
              containerWidth: 34.w,
              containerHeight: 34.h,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyMain.withValues(alpha: 0.5),
                  offset: Offset(0.w, 4.h),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
