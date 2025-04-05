import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/auth/manager/login/login_bloc.dart';
import 'package:store_app/features/auth/manager/sign_up/sign_up_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<SignUpBloc>();
    return ListenableBuilder(
      listenable: vm,
      builder: (BuildContext context, Widget? child) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 78.h,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login to your account",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "It’s great to see you again.",
                style: TextStyle(
                  color: Color(0xFF808080),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          children: [
            TextFormField(
              controller: vm.fullNameController,
            ),
            TextFormField(
              controller: vm.emailController,
            ),
            TextFormField(
              controller: vm.passwordController,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          final snackBar = SnackBar(
            content: Text("Ishladi malades!"),
            duration: Duration(seconds: 2),
          );
          final snackBar2 = SnackBar(
            content: Text("Ishlamadi!"),
            duration: Duration(seconds: 2),
          );
          if (await vm.signUp() && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }else {
            ScaffoldMessenger.of(context).showSnackBar(snackBar2);
          }
        }),
      ),
    );
  }
}
