import 'dart:convert';

import 'package:demo_avesoft/api_models/day_week_data.dart';
import 'package:demo_avesoft/api_models/month_year_data.dart';
import 'package:demo_avesoft/components/button_widget.dart';
import 'package:demo_avesoft/components/text_field_widget.dart';
import 'package:demo_avesoft/firebase/auth_controller.dart';
import 'package:demo_avesoft/helper/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class EmailLoginScreen extends StatefulWidget {
  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black87,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.5.w),
        child: Column(
          children: [
            Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.0.h,
            ),
            BuildTextField(
                controller: emailController,
                hintText: "Please enter your email"),
            SizedBox(
              height: 3.5.h,
            ),
            BuildTextField(
                controller: passController,
                hintText: "Please enter your password"),
            SizedBox(
              height: 6.0.h,
            ),
            BuildButton(
              buttonText: "Login",
              onTap: () {
                AuthController.instance
                    .loginWithEmail(emailController.text, passController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
