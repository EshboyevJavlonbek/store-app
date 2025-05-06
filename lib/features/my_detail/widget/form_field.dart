import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class FormFieldDetail extends StatelessWidget {
  const FormFieldDetail({super.key, required this.title, required this.hintText, required this.controller});
final String title , hintText;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.blackMain,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: "General Sans",
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 52,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Color(0xff1A1A1A),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                  width: 1.2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black, width: 1.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
