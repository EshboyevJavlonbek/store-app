// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:store_app/core/utils/colors.dart';
// import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
//
// class StoreAppCategoryItem extends StatefulWidget {
//   const StoreAppCategoryItem({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.price,
//     required this.discount,
//   });
//
//   final String image, title;
//   final int price;
//   final int discount;
//
//   @override
//   State<StoreAppCategoryItem> createState() => _StoreAppCategoryItemState();
// }
//
// class _StoreAppCategoryItemState extends State<StoreAppCategoryItem> {
//   bool isValid = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         GestureDetector(
//           onTap: (){},
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             spacing: 8.h,
//             children: [
//               Expanded(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.network(
//                     widget.image,
//                     width: 161.w,
//                     height: 174.h,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Text(
//                 widget.title,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 style: TextStyle(
//                   color: AppColors.blackMain,
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Row(
//                 spacing: 2.w,
//                 children: [
//                   Text(
//                     "\$ ${widget.price}",
//                     style: TextStyle(
//                       color: AppColors.greyMain,
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   widget.discount != 0
//                       ? Text(
//                           "-${widget.discount}%",
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         )
//                       : SizedBox.shrink(),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           top: 12.h,
//           left: 115.w,
//           child: StoreIconButtonContainer(
//             image:
//                 "assets/icons/${isValid ? 'heart_filled' : 'heart'}.svg",
//             iconColor: isValid ? Colors.red : AppColors.blackMain,
//             callback: () {
//               setState(() {
//                 isValid = !isValid;
//               });
//             },
//             containerWidth: 34.w,
//             containerHeight: 34.h,
//             borderRadius: BorderRadius.circular(8),
//             boxShadow: [
//               BoxShadow(
//                 color: AppColors.greyMain,
//                 offset: Offset(0.w, 8.h),
//                 blurRadius: 10,
//                 spreadRadius: 0,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';

class StoreAppCategoryItem extends StatefulWidget {
  const StoreAppCategoryItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.discount, required this.id,
  });

  final String image, title;
  final int price;
  final int discount, id;

  @override
  State<StoreAppCategoryItem> createState() => _StoreAppCategoryItemState();
}

class _StoreAppCategoryItemState extends State<StoreAppCategoryItem> {
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 8.h,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.image,
                    width: 161.w,
                    height: 174.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 12.h,
                  left: 115.w,
                  child: StoreIconButtonContainer(
                    image:
                        "assets/icons/${isValid ? 'heart_filled' : 'heart'}.svg",
                    iconColor: isValid ? Colors.red : AppColors.blackMain,
                    callback: () {
                      setState(() {
                        isValid = !isValid;
                      });
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
          SizedBox(
            width: 161.w,
            height: 42.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: AppColors.blackMain,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  spacing: 2.w,
                  children: [
                    Text(
                      "\$ ${widget.price}",
                      style: TextStyle(
                        color: AppColors.greyMain,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    widget.discount != 0
                        ? Text(
                            "-${widget.discount}%",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
