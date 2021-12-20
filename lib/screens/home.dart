import 'package:demo_avesoft/components/button_widget.dart';
import 'package:demo_avesoft/screens/charts.dart';
import 'package:demo_avesoft/screens/email_login.dart';
import 'package:demo_avesoft/screens/phone_number_login.dart';
import 'package:demo_avesoft/screens/email_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "JOIN BUMPER",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.5.h,
              ),
              BuildButton(
                buttonText: "Email Signup",
                onTap: () {
                  Get.to(
                    () => EmailSignupScreen(),
                  );
                },
              ),
              SizedBox(
                height: 2.4.h,
              ),
              BuildButton(
                buttonText: "Email Login",
                onTap: () {
                  Get.to(
                    () => EmailLoginScreen(),
                  );
                },
              ),
              SizedBox(
                height: 2.4.h,
              ),
              Text(
                "OR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11.sp,
                ),
              ),
              SizedBox(
                height: 2.4.h,
              ),
              BuildButton(
                buttonText: "Phone Login",
                onTap: () {
                  Get.to(
                    () => PhoneNumLoginScreen(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
