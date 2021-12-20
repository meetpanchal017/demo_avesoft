import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';

void configEasyLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorColor = Colors.pinkAccent
    ..backgroundColor = Colors.black54
    ..userInteractions = false
    ..dismissOnTap = false;
}

void showEasyLoading() {
  if (!EasyLoading.isShow) {
    EasyLoading.show(
      dismissOnTap: false,
    );
  }
}

void dismissEasyLoading() {
  EasyLoading.dismiss();
}
