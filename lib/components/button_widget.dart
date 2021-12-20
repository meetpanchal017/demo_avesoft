import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BuildButton extends StatelessWidget {
  final String buttonText;
  final GestureTapCallback onTap;

  BuildButton({required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        height: 5.8.h,
        width: 48.0.w,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 10.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
