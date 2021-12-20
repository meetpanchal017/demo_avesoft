import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isInputNum;
  final bool isShowingContryCode;
  int? maxLength;

  BuildTextField({
    required this.controller,
    required this.hintText,
    this.isInputNum = false,
    this.isShowingContryCode = false,
    this.maxLength = null,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: isInputNum ? TextInputType.number : TextInputType.text,
      decoration: new InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.pinkAccent, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.pinkAccent, width: 1.0),
          ),
          prefixText: isShowingContryCode ? "+91" : null,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black38)),
      style: TextStyle(color: Colors.pinkAccent),
      maxLength: maxLength,
    );
  }
}
