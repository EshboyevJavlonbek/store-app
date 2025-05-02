import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';
import 'package:store_app/features/details/maneger/details_bloc.dart';
import 'package:store_app/features/details/maneger/details_state.dart';
import '../../common/widgets/store_icon_button_container.dart';
import '../../../data/model/detail_model.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  String? selectedSize;
  bool isValid = false;
  final List<String> sizes = ["S", "M", "L"];

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
        } else if (state.status == DetailStatus.success && state.detail != null) {
          return _buildDetailBody(state.detail!);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildDetailBody(DetailModel detail) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "Details",
        actions: [
          StoreIconButtonContainer(image: '', callback: () {}),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 341.w,
                height: 368.h,
                child: Stack(
                  children: [
                    PageView.builder(
                      itemCount: detail.productImages.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            detail.productImages[index].image,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: 12.h,
                      left: 290.w,
                      child: StoreIconButtonContainer(
                        image: "assets/icons/${isValid ? 'heart_filled' : 'heart'}.svg",
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
              SizedBox(height: 16),
              Text(
                detail.title,
                style: TextStyle(
                  fontFamily: "General Sans",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/star_filled.svg"),
                  SizedBox(width: 4),
                  RichText(
                    text: TextSpan(
                      text: '${detail.rating.toStringAsFixed(1)}/5 ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "General Sans",
                      ),
                      children: [
                        TextSpan(
                          text: '(${detail.reviewsCount} reviews)',
                          style: TextStyle(color: AppColors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                detail.description,
                style: TextStyle(
                  color: AppColors.grey,
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Choose size",
                style: TextStyle(
                  color: AppColors.blackMain,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: "General Sans",
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: sizes.map((size) {
                  final isSelected = size == selectedSize;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = size;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 50.w,
                        height: 47.h,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: Border.all(color: AppColors.greySub, width: 1.w),
                        ),
                        child: Text(
                          size,
                          style: TextStyle(
                            color: isSelected ? Colors.white : AppColors.greySub,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            fontFamily: "General Sans",
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Container(
          height: 105,
          width: double.infinity,
          color: Colors.white,
          child: Row(
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
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '\$${detail.price.toString()}',
                    style: TextStyle(
                      color: AppColors.blackMain,
                      fontFamily: "General Sans",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  )

                ],
              ),
              SizedBox(width: 15),
              StoreAppButton(
                svgPvg:  "assets/icons/bag.svg",
                text: "Add to Cart",
                callback: () {
                  if (selectedSize == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select a size first")),
                    );
                    return;
                  }
                },
                containerColor: AppColors.blackMain,
                containerWidth: 240.w,
                containerHeight: 54.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
