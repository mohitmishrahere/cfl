import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:telephony/telephony.dart';

import '../../screens/authentication/signup/create_password.dart';

class LoginOTPController extends GetxController {
  final pinController = TextEditingController();
  var verId = ''.obs;
  var loading = false.obs;
  var mobile = ''.obs;
  var start = 60.obs;
  late Timer timer;
  var timerCompleted = false.obs;
  var isResent = false.obs;
  var isResending = false.obs;
  var isForgot = false.obs;
  final Telephony telephony = Telephony.instance;

  String get timerText {
    int minutes = start.value ~/ 60;
    int seconds = start.value % 60;
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  @override
  void onInit() {
    super.onInit();
    pinController.text = '______';
    pinController.addListener(() {
      if(pinController.text == '______'){
        pinController.clear();
      }
    });
    if(Get.arguments!=null){
      mobile.value = Get.arguments[0];
      verId.value = Get.arguments[1];
      isForgot.value = Get.arguments[2];
    }

    startTimer();
    startListeningForSMS();
  }

  @override
  void onClose() {
    super.onClose();
    timer.cancel();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
          // Handle timer completion here
          timerCompleted.value = true;
          print('Timer complete');
        } else {
          start.value--;
        }
      },
    );
  }

  // Future<void> listenForCode() async {
  //   await SmsAutoFill().listenForCode();
  // }

  Future<void> verifyOTP(String verId, String otp) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verId,
      smsCode: otp,
    );
    try {
      await FirebaseAuth.instance
          .signInWithCredential(phoneAuthCredential)
          .then((userCredential) {
        if (userCredential.user != null) {
          loading.value = false;
          Get.off(()=>CreatePasswordScreen(), arguments: [mobile.value, isForgot.value]);
          // Get.to(()=>SignUp(), arguments: [cont.mobile.value]);
        }
      });
    } catch (e) {
      print(e.toString());
      loading.value = false;
      if(e.toString().contains('The verification code from SMS/TOTP is invalid')){
        Fluttertoast.showToast(msg: 'Invalid OTP');
      }
    }
    // Get.off(() => CreatePasswordScreen(), arguments: [cont.mobile.value]);
  }

  void startListeningForSMS() {
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        String smsBody = message.body ?? "";
        // Assuming OTP is a 6 digit number
        RegExp regExp = RegExp(r'\d{6}');
        var match = regExp.firstMatch(smsBody);
        if (match != null) {
          pinController.text = match.group(0)!;
          verifyOTP(verId.value, pinController.text);
        }
      },
      listenInBackground: false,
    );
  }
}