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
  });

  final String title, hintText;
  final TextEditingController controller;

  final String? Function(String? value) validator;

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
            focusNode: focusNode,
            onTapOutside: (event) => focusNode.unfocus(),
            validator: widget.validator,
            maxLines: 1,
            style: TextStyle(
              color: AppColors.blackMain,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            obscureText: _obscure,
            obscuringCharacter: "●",
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: SvgPicture.asset(
                  switch (_obscure) {
                    true => "StoreAppAssets/icons/hide_password.svg",
                    false => "StoreAppAssets/icons/show_password.svg"
                  },
                  width: 19.69.w,
                  height: 18.h,
                  fit: BoxFit.cover,
                ),
                onPressed: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
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
                  color: AppColors.whiteSub,
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
