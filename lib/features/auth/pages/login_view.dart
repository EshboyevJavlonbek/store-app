import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/auth/manager/login/login_bloc.dart';
import 'package:store_app/features/auth/pages/title_and_description.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<LoginBloc>();
    return ListenableBuilder(
      listenable: vm,
      builder: (BuildContext context, Widget? child) => Scaffold(
        body: ListView(
          padding: EdgeInsets.only(
            top: 32.h,
            left: 24.w,
            right: 24.w,
            bottom: 1.h,
          ),
          children: [
            TitleAndDescription(),
            TextFormField(
              controller: vm.emailController,
            ),
            TextFormField(
              controller: vm.passwordController,
            )
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
          if (await vm.login() && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(snackBar2);
          }
        }),
      ),
    );
  }
}
