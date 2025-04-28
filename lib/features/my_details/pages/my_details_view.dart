import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/common/widgets/store_text_form_field.dart';
import 'package:store_app/features/my_details/widgets/store_date_of_birth.dart';
import 'package:store_app/features/my_details/widgets/store_gender_box.dart';
import 'package:store_app/features/my_details/widgets/store_phone_number_feild.dart';

class MyDetailView extends StatefulWidget {
  const MyDetailView({super.key});

  @override
  State<MyDetailView> createState() => _MyDetailViewState();
}

class _MyDetailViewState extends State<MyDetailView> {
  String? selectedGender;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final List<String> genderList = [
    'Male',
    'Female',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "My Details",
        actions: [
          StoreIconButtonContainer(
              image: "assets/icons/notification.svg", callback: () {}),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 24.h),
          child: Divider(color: AppColors.greySub),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          children: [
            StoreTextFormField(
              validator: (value) => null,
              title: "FullName",
              hintText: "Cody Fisher",
              controller: nameController,
              isValid: null,
            ),
            SizedBox(height: 16.h),
            StoreTextFormField(
              validator: (value) => null,
              title: "Email",
              hintText: "cody.fisher45@example",
              controller: emailController,
              isValid: null,
            ),
            SizedBox(height: 16.h),
            StoreDateOfBirth(title: 'Date of Birth'),
            SizedBox(height: 16.h),
            StoreGenderBox(),
            SizedBox(height: 16.h),
            StorePhoneNumber(controller: phoneController),
            SizedBox(height: 94.h),
            StoreAppButton(
              text: "Submit",
              callback: () {},
              containerColor: Colors.black,
              containerWidth: double.infinity,
            ),
          ],
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
