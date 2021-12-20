import 'package:demo_avesoft/components/button_widget.dart';
import 'package:demo_avesoft/components/text_field_widget.dart';
import 'package:demo_avesoft/firebase/auth_controller.dart';
import 'package:demo_avesoft/screens/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PhoneNumLoginScreen extends StatefulWidget {
  const PhoneNumLoginScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumLoginScreen> createState() => _PhoneNumLoginScreenState();
}

class _PhoneNumLoginScreenState extends State<PhoneNumLoginScreen> {
  TextEditingController phoneNumController = TextEditingController();

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
              "What is your phone number?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.0.h,
            ),
            BuildTextField(
              controller: phoneNumController,
              hintText: "Please enter your phone number",
              isInputNum: true,
              isShowingContryCode: true,
              maxLength: 10,
            ),
            SizedBox(
              height: 6.0.h,
            ),
            BuildButton(
              buttonText: "Send Code",
              onTap: () {
                AuthController.instance.loginWithPhone(phoneNumController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpVerificationScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
