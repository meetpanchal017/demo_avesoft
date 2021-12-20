import 'package:demo_avesoft/components/button_widget.dart';
import 'package:demo_avesoft/components/text_field_widget.dart';
import 'package:demo_avesoft/firebase/auth_controller.dart';
import 'package:demo_avesoft/screens/first_last_name.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black87,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 2.0.h),
        child: Column(
          children: [
            Text(
              "What is your code?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.0.h,
            ),
            BuildTextField(
              controller: otpController,
              hintText: "Please enter your verification code",
              isInputNum: true,
              maxLength: 6,
            ),
            SizedBox(
              height: 6.0.h,
            ),
            BuildButton(
                buttonText: "Verify Code",
                onTap: () {
                  AuthController.instance.verifyOTP(otpController.text);
                })
          ],
        ),
      ),
    );
  }
}
