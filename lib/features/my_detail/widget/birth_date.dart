import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/colors.dart';

class MyDetailsDateBirth extends StatefulWidget {
  const MyDetailsDateBirth({super.key, required this.title});

  final String title;

  @override
  State<MyDetailsDateBirth> createState() => _MyDetailsDateBirthState();
}

class _MyDetailsDateBirthState extends State<MyDetailsDateBirth> {
  DateTime? selectedDate;
  final TextEditingController _controller = TextEditingController();

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _controller.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.r,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 3.h),
        GestureDetector(
          onTap: _pickDate,
          child: AbsorbPointer(
            child: TextFormField(
              controller: _controller,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintText: 'dd/mm/yyyy',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: AppColors.grey),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    width: 21,
                    height: 19,
                    child: SvgPicture.asset(
                      'assets/icons/date.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
