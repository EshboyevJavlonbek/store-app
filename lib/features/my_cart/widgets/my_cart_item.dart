import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/data/model/my_cart/cart_item/cart_item_model.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';

import '../../../core/utils/colors.dart';

class MyCartItem extends StatelessWidget {
  const MyCartItem({
    super.key,
    required this.item,
  });

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
          width: 342.w,
          height: 107.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.whiteSub,
              width: 1.w,
            ),
          ),
          child: Row(
            spacing: 10.w,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  imageUrl: item.image,
                  width: 83.w,
                  height: 79.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 213.w,
                height: 79.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            color: AppColors.blackMain,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        StoreIconButtonContainer(
                          image: "assets/icons/trash.svg",
                          iconColor: Colors.red,
                          callback: () {},
                        ),
                      ],
                    ),
                    Text(
                      "Size ${item.size}",
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ ${item.price}",
                          style: TextStyle(
                            color: AppColors.blackMain,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 72.5.w,
                          height: 22.37.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              StoreIconButtonContainer(
                                containerWidth: 23.75,
                                containerHeight: 22.37,
                                iconWidth: 10.94,
                                iconHeight: 1.31,
                                border: Border.all(
                                  color: Color(0xFFCCCCCC),
                                  width: 1.w,
                                ),
                                borderRadius: BorderRadius.circular(3),
                                image: "assets/icons/minus.svg",
                                callback: () {},
                              ),
                              Text(
                                item.quantity.toString(),
                                style: TextStyle(
                                  color: AppColors.blackMain,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              StoreIconButtonContainer(
                                containerWidth: 23.75,
                                containerHeight: 22.37,
                                iconWidth: 11,
                                iconHeight: 11,
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                  color: Color(0xFFCCCCCC),
                                  width: 1.w,
                                ),
                                image: "assets/icons/plus.svg",
                                callback: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 14.h),
      ],
    );
  }
}
