import 'package:demo_avesoft/components/button_widget.dart';
import 'package:demo_avesoft/components/text_field_widget.dart';
import 'package:demo_avesoft/screens/charts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ContactInputScreen extends StatefulWidget {
  const ContactInputScreen({Key? key}) : super(key: key);

  @override
  _ContactInputScreenState createState() => _ContactInputScreenState();
}

class _ContactInputScreenState extends State<ContactInputScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
              "What is your Contact?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.0.h,
            ),
            BuildTextField(
                controller: emailController, hintText: "Please enter Email"),
            SizedBox(
              height: 3.5.h,
            ),
            BuildTextField(
                controller: phoneController, hintText: "Please enter Phone"),
            SizedBox(
              height: 6.0.h,
            ),
            BuildButton(
              buttonText: "Submit",
              onTap: () {
                Get.offAll(
                  () => ChartScreen(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
