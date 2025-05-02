import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';

import '../../common/widgets/store_button_container.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/images/onboarding_pattern.png"),
            ),
            Text(
              "Define yourself in your unique way.",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Color(0xff1A1A1A),
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w600,
                fontSize: 64,
                height: 0.8,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/images/onboarding_person.png"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 107,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StoreButtonContainer(
              width: 341,
              height: 54,
              title: "Get Started",
              textColor: Colors.white,
              buttonColor: Colors.black,
              callback: () {context.go(Routes.signUp);},
            ),
            SizedBox(height: 20),
            Container(
              width: 134,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
