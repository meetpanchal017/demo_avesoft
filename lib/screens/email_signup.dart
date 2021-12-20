import 'package:demo_avesoft/components/button_widget.dart';
import 'package:demo_avesoft/components/text_field_widget.dart';
import 'package:demo_avesoft/firebase/auth_controller.dart';
import 'package:demo_avesoft/screens/address_details.dart';
import 'package:demo_avesoft/screens/first_last_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EmailSignupScreen extends StatefulWidget {
  const EmailSignupScreen({Key? key}) : super(key: key);

  @override
  _EmailSignupScreenState createState() => _EmailSignupScreenState();
}

class _EmailSignupScreenState extends State<EmailSignupScreen> {
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
              "Signup",
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
              buttonText: "Signup",
              onTap: () {
                AuthController.instance
                    .register(emailController.text, passController.text)
                    .then(
                  (value) {
                    if (AuthController.isUserLoggedIn == true) {
                      Get.offAll(
                        () => FirstLastNameScreen(),
                      );
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
