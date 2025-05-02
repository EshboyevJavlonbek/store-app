import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class StoreGenderBox extends StatefulWidget {
  const StoreGenderBox({super.key});

  @override
  State<StoreGenderBox> createState() => _StoreGenderBoxState();
}

class _StoreGenderBoxState extends State<StoreGenderBox> {
  String? select;

  List<String> item = ['Male', "Female"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 3.h),
        DropdownMenu<String>(
          width: double.infinity,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.grey),),
            constraints: BoxConstraints.tight(Size(double.infinity, 52)),
          ),
          initialSelection: select,
          hintText: "Gender",
          onSelected: (String? value) {
            setState(() {
              select = value;
            });
          },
          dropdownMenuEntries:
          item.map((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
      ],
    );
  }
}