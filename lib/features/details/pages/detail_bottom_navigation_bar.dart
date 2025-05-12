import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/data/model/detail/detail_model.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';
import 'package:store_app/features/details/maneger/details_bloc.dart';

class DetailBottomNavigationBar extends StatelessWidget {
  const DetailBottomNavigationBar({
    super.key,
    required this.selectedSize,
    required this.product,
  });

  final int selectedSize;
  final DetailModel? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      height: 105.h,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        spacing: 14.w,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Price",
                style: TextStyle(
                  color: AppColors.grey,
                  fontFamily: "General Sans",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '\$${product!.price.toString()}',
                style: TextStyle(
                  color: AppColors.blackMain,
                  fontFamily: "General Sans",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          StoreAppButton(
            text: "Add to Cart",
            callback: () {
              if (selectedSize == -1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please select a size first")),
                );
              } else {
                context.read<DetailsBloc>().add(
                      DetailAddProduct(
                        productId: product!.id,
                        sizeId: selectedSize ,
                      ),
                    );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Mahsulot qo'shildi."), duration: Duration(seconds: 3),),
                );
              }
            },
            containerColor: AppColors.blackMain,
            containerWidth: 240.w,
            containerHeight: 54.h,
          ),
        ],
      ),
    );
  }
}
