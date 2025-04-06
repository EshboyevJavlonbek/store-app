import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/auth/manager/sign_up/sign_up_bloc.dart';
import 'package:store_app/features/auth/widgets/store_password_field.dart';
import 'package:store_app/features/auth/widgets/store_text_form_field.dart';

class SignUpViewForm extends StatelessWidget {
  const SignUpViewForm({
    super.key,
    required this.vm,
  });

  final SignUpBloc vm;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: vm.formKey,
      child: Column(
        spacing: 10.h,
        children: [
          StoreTextFormField(
            validator: (value) => null,
            title: "Full Name",
            hintText: "Enter your full name",
            controller: vm.fullNameController,
          ),
          StoreTextFormField(
            validator: (value) => null,
            title: "Email",
            hintText: "Enter your email address",
            controller: vm.emailController,
          ),
          StorePasswordField(
            validator: (value) => null,
            title: "Password",
            hintText: "Enter your password",
            controller: vm.passwordController,
          ),
        ],
      ),
    );
  }
}
