import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/checkout/pages/payment_button.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/common/widgets/store_button_container.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/common/widgets/store_password_field.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedPayment = 'Card';
  final promoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: 'Checkout',
        actions: [
          StoreIconButtonContainer(
            image: "assets/icons/notification.svg",
            callback: () => context.push(Routes.notification),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size(double.infinity, 24.h),
            child: Divider(color: AppColors.whiteSub)),
      ),
      extendBody: true,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 1.h),
        children: [
          SizedBox(
            width: double.infinity,
            height: 100.h,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Address",
                      style: TextStyle(
                        color: AppColors.blackMain,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        text: 'Change',
                        style: TextStyle(
                          color: AppColors.blackMain,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StoreIconButtonContainer(
                      image: "assets/icons/map_pin.svg",
                      iconWidth: 17.25.w,
                      iconHeight: 21.75.h,
                      iconColor: AppColors.grey,
                      callback: () {},
                    ),
                    SizedBox(width: 5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Home",
                          style: TextStyle(
                            color: AppColors.blackMain,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "925 S Chugach St #APT 10, Alaska 99645",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: AppColors.whiteSub),
          SizedBox(
            width: double.infinity,
            child: Column(
              spacing: 16.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Method",
                  style: TextStyle(
                    color: AppColors.blackMain,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PaymentButton(
                      image: "assets/icons/card.svg",
                      title: "Card",
                      callback: () {
                        setState(() {
                          selectedPayment = 'Card';
                        });
                      },
                      color: selectedPayment == 'Card'
                          ? AppColors.blackMain
                          : AppColors.white,
                      iconColor: selectedPayment == 'Card'
                          ? Colors.white
                          : AppColors.blackMain,
                      titleColor: selectedPayment == 'Card'
                          ? Colors.white
                          : AppColors.blackMain,
                    ),
                    PaymentButton(
                      image: "assets/icons/cash.svg",
                      title: "Cash",
                      callback: () {
                        setState(() {
                          selectedPayment = 'Cash';
                        });
                      },
                      color: selectedPayment == 'Cash'
                          ? AppColors.blackMain
                          : AppColors.white,
                      iconColor: selectedPayment == 'Cash'
                          ? Colors.white
                          : AppColors.blackMain,
                      titleColor: selectedPayment == 'Cash'
                          ? Colors.white
                          : AppColors.blackMain,
                    ),
                  ],
                ),
                if (selectedPayment == 'Card')
                  StorePasswordField(
                    maxLength: 16,
                    keyboardType: TextInputType.number,
                    validator: (value) => null,
                    title: "",
                    hintText: "Enter your card",
                    controller: TextEditingController(),
                    isValid: null,
                  ),
              ],
            ),
          ),
          Divider(color: AppColors.whiteSub),
          Column(
            spacing: 16.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order Summary",
                style: TextStyle(
                  color: AppColors.blackMain,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sub-total",
                    style: TextStyle(
                      color: AppColors.greyMain,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "\$ 5,870",
                    style: TextStyle(
                      color: AppColors.blackMain,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "VAT (%)",
                    style: TextStyle(
                      color: AppColors.greyMain,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "\$ 0,00",
                    style: TextStyle(
                      color: AppColors.blackMain,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shipping fee",
                    style: TextStyle(
                      color: AppColors.greyMain,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "\$ 80",
                    style: TextStyle(
                      color: AppColors.blackMain,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Divider(color: AppColors.whiteSub),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      color: AppColors.blackMain,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "\$ 5,870",
                    style: TextStyle(
                      color: AppColors.blackMain,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                    width: 249.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.whiteSub,
                        width: 1.w,
                      ),
                    ),
                    child: Row(
                      spacing: 5.w,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/promo.svg",
                          width: 21.w,
                          height: 21.h,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: TextField(
                            controller: promoController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Search for clothes...',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  StoreButtonContainer(
                    title: "Add",
                    textColor: AppColors.white,
                    callback: () {},
                    width: 84.w,
                    height: 52.h,
                    buttonColor: AppColors.blackMain,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
