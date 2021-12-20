import 'package:demo_avesoft/components/button_widget.dart';
import 'package:demo_avesoft/components/text_field_widget.dart';
import 'package:demo_avesoft/firebase/auth_controller.dart';
import 'package:demo_avesoft/screens/address_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FirstLastNameScreen extends StatefulWidget {
  const FirstLastNameScreen({Key? key}) : super(key: key);

  @override
  _FirstLastNameScreenState createState() => _FirstLastNameScreenState();
}

class _FirstLastNameScreenState extends State<FirstLastNameScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              AuthController.instance.logout();
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      backgroundColor: Colors.black87,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 2.0.h),
        child: Column(
          children: [
            Text(
              "What is your name?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.0.h,
            ),
            BuildTextField(
                controller: firstNameController,
                hintText: "Please enter First name"),
            SizedBox(
              height: 3.5.h,
            ),
            BuildTextField(
                controller: lastNameController,
                hintText: "Please enter Last name"),
            SizedBox(
              height: 6.0.h,
            ),
            BuildButton(buttonText: "Continue", onTap: () {
              Get.to(() => AddressInputScreen());
            })
          ],
        ),
      ),
    );
  }
}
