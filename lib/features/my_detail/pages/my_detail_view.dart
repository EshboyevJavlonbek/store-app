import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';

import '../widget/birth_date.dart';
import '../widget/form_field.dart';
import '../widget/gender.dart';
import '../widget/phone_number.dart';

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
  final List<String> genderList = ['Male', 'Female',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "My Details",
        actions: [
          SvgPicture.asset("assets/icons/notification.svg"),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: Divider(color: Color(0xffE6E6E6), thickness: 2),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormFieldDetail(title: "Full Name", hintText: 'Cody Fisher', controller: nameController),
            FormFieldDetail(title: "Email Address", hintText: "cody.fisher45@example", controller: emailController),
            MyDetailsDateBirth(title: 'Date of Birth'),
            MyDetailGender(),
            PhoneNumber(controller: phoneController,),
            SizedBox(height: 74),
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
