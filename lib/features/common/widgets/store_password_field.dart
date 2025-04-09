import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class StorePasswordField extends StatefulWidget {
  const StorePasswordField({
    super.key,
    required this.validator,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.isValid,
  });

  final String title, hintText;
  final TextEditingController controller;

  final String? Function(String? value) validator;
  final bool? isValid;

  @override
  State<StorePasswordField> createState() => _StorePasswordFieldState();
}

class _StorePasswordFieldState extends State<StorePasswordField> {
  final focusNode = FocusNode();

  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.blackMain,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 0,
          ),
        ),
        SizedBox(
          width: 341.w,
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUnfocus,
            style: TextStyle(
              color: AppColors.blackMain,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            obscureText: _obscure,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: widget.isValid != null && widget.isValid!
                      ? Colors.green
                      : AppColors.greySub,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 2,
                  color: widget.isValid != null && widget.isValid!
                      ? Colors.green
                      : AppColors.greySub,
                ),
              ),
              suffixIconConstraints: BoxConstraints.loose(
                Size(double.infinity, double.infinity),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: AnimatedCrossFade(
                  firstChild: IconButton(
                    onPressed: () => setState(() => _obscure = !_obscure),
                    icon: SvgPicture.asset(
                      "StoreAppAssets/icons/hide_password.svg",
                      width: 20.w,
                      height: 20.w,
                    ),
                  ),
                  secondChild: IconButton(
                    onPressed: () => setState(() => _obscure = !_obscure),
                    icon: SvgPicture.asset(
                      "StoreAppAssets/icons/show_password.svg",
                      width: 20.w,
                      height: 20.w,
                    ),
                  ),
                  crossFadeState: _obscure
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 100),
                ),
              ),
              filled: true,
              fillColor: AppColors.white,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: AppColors.grey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                height: 1.h,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.blackMain,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
