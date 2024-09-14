import 'package:cfl/controllers/auth/login_otp_controller.dart';
import 'package:cfl/screens/authentication/signup/create_password.dart';
import 'package:cfl/screens/authentication/signup/sign_up_personal_info.dart';
import 'package:cfl/widgets/pin_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
// import 'package:pinput/pinput.dart';

class LoginOTPScreen extends StatelessWidget {
  LoginOTPScreen({super.key});

  static const focusedBorderColor = Color(0xffFDBC0E);
  static const fillColor = Color.fromRGBO(243, 246, 249, 0);
  static const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
  final focusNode = FocusNode();

  final LoginOTPController cont = Get.put(LoginOTPController());

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 48,
    textStyle: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xff333B63),
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
        color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    // pinController.text = '______';
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff365EF1), Color(0xff2799EB)],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .59,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Stack(
                  children: [
                    Image.asset('assets/images/sliderbg.png'),
                    Positioned(
                        right: 0,
                        left: 0,
                        bottom: 0,
                        child: Image.asset(
                          'assets/images/loginOTP.png',
                          scale: 2.15,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40, top: 39, bottom: 39),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verify OTP !',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffFDBC0E),
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'OTP Number',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Pinput(
                      length: 6,
                      controller: cont.pinController,
                      focusNode: focusNode,
                      // androidSmsAutofillMethod:
                      //     AndroidSmsAutofillMethod.smsUserConsentApi,
                      // listenForMultipleSmsOnAndroid: true,
                      defaultPinTheme: defaultPinTheme,
                      separatorBuilder: (index) => const SizedBox(width: 8),
                      // validator: (value) {
                      //   return value == '222222' ? null : 'Pin is incorrect';
                      // },
                      // onClipboardFound: (value) {
                      //   debugPrint('onClipboardFound: $value');
                      //   pinController.setText(value);
                      // },
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        debugPrint('onCompleted: $pin');
                      },
                      onChanged: (value) {
                        debugPrint('onChanged: $value');
                      },

                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: focusedBorderColor,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: focusedBorderColor),
                            color: Colors.white),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                            // color: fillColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: focusedBorderColor),
                            color: Colors.white),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.redAccent)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          cont.isResent.value
                              ? SizedBox(
                                  height: 9,
                                )
                              : cont.timerCompleted.value
                                  ? cont.isResending.value
                                      ? SizedBox(
                                          height: 13,
                                          width: 13,
                                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white,))
                                      : cont.isResent.value
                                          ? SizedBox()
                                          : InkWell(
                                              onTap: () async {
                                                cont.isResending.value = true;
                                                print('+91'+cont.mobile.value);
                                                await FirebaseAuth.instance
                                                    .verifyPhoneNumber(
                                                        verificationCompleted:
                                                            (PhoneAuthCredential
                                                                credential) {},
                                                        verificationFailed:
                                                            (FirebaseAuthException
                                                                e) {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  "Something Went Wrong!, Try Again");
                                                          // Fluttertoast.showToast(
                                                          //     msg: e.toString());
                                                          // e.toString();
                                                          cont.isResending
                                                              .value = false;
                                                        },
                                                        codeSent: (String verId,
                                                            int? resendToken) {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  "OTP Resent");
                                                          cont.isResending
                                                              .value = false;
                                                          cont.isResent.value = true;
                                                          cont.verId.value =
                                                              verId;
                                                        },
                                                        codeAutoRetrievalTimeout:
                                                            (String
                                                                verificationId) {},
                                                        timeout: Duration(
                                                            seconds: 60),
                                                        phoneNumber: '+91' +
                                                            cont.mobile.value);
                                              },
                                              child: Text(
                                                'Resend OTP',
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white),
                                              ))
                                  : Text(
                                      '${cont.timerText}s',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => cont.loading.value
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : InkWell(
                                  onTap: () {
                                    if (validated(cont.pinController.text)) {
                                      cont.loading.value = true;
                                      cont.verifyOTP(cont.verId.value,
                                          cont.pinController.text);
                                    }
                                    // Get.to(() => SignUp());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        33, 12, 33, 12),
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xffF3C309),
                                            Color(0xffF2A40E)
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      'Verify',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xff333B63)),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validated(String text) {
    if (text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please Enter OTP');
      return false;
    } else if (text.length != 6) {
      Fluttertoast.showToast(msg: 'Please Enter Complete OTP');
      return false;
    } else if (text.contains('_')){
      Fluttertoast.showToast(msg: 'Please Enter Complete OTP');
      return false;
    }
    return true;
  }
}
