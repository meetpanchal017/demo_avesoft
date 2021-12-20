import 'package:demo_avesoft/components/button_widget.dart';
import 'package:demo_avesoft/components/text_field_widget.dart';
import 'package:demo_avesoft/screens/contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddressInputScreen extends StatefulWidget {
  @override
  State<AddressInputScreen> createState() => _AddressInputScreenState();
}

class _AddressInputScreenState extends State<AddressInputScreen> {
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();

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
              "What is your Address?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.0.h,
            ),
            BuildTextField(
                controller: streetController, hintText: "Please enter Street"),
            SizedBox(
              height: 3.5.h,
            ),
            BuildTextField(
                controller: cityController, hintText: "Please enter City"),
            SizedBox(
              height: 3.5.h,
            ),
            BuildTextField(
              controller: zipcodeController,
              hintText: "Please enter Zip",
              isInputNum: true,
            ),
            SizedBox(
              height: 6.0.h,
            ),
            BuildButton(
              buttonText: "Continue",
              onTap: () {
                Get.to(
                  () => ContactInputScreen(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
