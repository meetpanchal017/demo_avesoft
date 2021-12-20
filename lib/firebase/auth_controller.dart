import 'package:demo_avesoft/screens/first_last_name.dart';
import 'package:demo_avesoft/screens/home.dart';
import 'package:demo_avesoft/screens/charts.dart';
import 'package:demo_avesoft/screens/email_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  var verificationID = "";
  static bool isUserLoggedIn = false;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(
      auth.userChanges(),
    );
  }

  _initialScreen(User? user) {
    print("Initial method");
    if (user == null) {
      Get.offAll(
        () => HomeScreen(),
      );
    } else {
      Get.offAll(() => ChartScreen());
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          isUserLoggedIn = true;
          Get.snackbar(
            "About User",
            "Success Message",
            snackPosition: SnackPosition.BOTTOM,
            titleText: Text("Successfully Registered"),
          );
        },
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        "About User",
        "Error Message",
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text("Registration Failed"),
      );
    }
  }

  void loginWithEmail(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          isUserLoggedIn = true;
          ever(_user, _initialScreen);
        },
      );
    } catch (e) {
      Get.snackbar(
        "About User",
        "Error Message",
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text("Registration Failed"),
      );
    }
  }

  void loginWithPhone(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+91" + phoneNumber,
      verificationCompleted: (AuthCredential authCredentials) {},
      verificationFailed: (authException) {},
      codeSent: (String id, [int? forceResent]) {
        this.verificationID = id;
      },
      codeAutoRetrievalTimeout: (id) {
        this.verificationID = id;
      },
      timeout: Duration(seconds: 60),
    );
  }

  void verifyOTP(String otp) async {
    try {
      var credential = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationID, smsCode: otp),
      );
      if (credential.user != null) {
        ever(_user, _initialScreen);
      }
    } catch (e) {
      Get.snackbar(
        "About User",
        "Error Message",
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text("Login Failed"),
      );
    }
  }

  void logout() async {
    await auth.signOut().then(
      (value) {
        isUserLoggedIn = false;
        Get.offAll(
          () => HomeScreen(),
        );
      },
    );
  }
}
