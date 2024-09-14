import 'dart:ffi';

import 'package:cfl/api/api_services.dart';
import 'package:cfl/screens/authentication/login_otp.dart';
import 'package:cfl/screens/authentication/login_password.dart';
import 'package:cfl/screens/authentication/signup/sign_up_address_info.dart';
import 'package:cfl/screens/authentication/signup/sign_up_personal_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/auth/login_phone_controller.dart';

class LoginPhoneScreen extends StatelessWidget {
  LoginPhoneScreen({super.key});

  LoginPhoneController cont = Get.put(LoginPhoneController());

  @override
  Widget build(BuildContext context) {
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
            // crossAxisAlignment: CrossAxisAlignment.start,
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
                    Image.asset('assets/images/sliderbg.png', fit: BoxFit.cover,),
                    Positioned(
                        right: 0,
                        left: 0,
                        bottom: -30,
                        child: Image.asset(
                          'assets/images/loginPhone.png',
                          scale: 1.6,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40, top: 39,bottom: 39),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome !',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffFDBC0E),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        shadows: cont.phoneFocusNode.hasFocus
                            ? [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 1.0,
                            color: Color(0x80000000),
                          ),
                        ]
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Enter Mobile Number',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        shadows: cont.phoneFocusNode.hasFocus
                            ? [
                          Shadow(
                            offset: Offset(1.5, 1.5),
                            blurRadius: 1.0,
                            color: Color(0x80000000),
                          ),
                        ]
                            : null,),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .81,
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 28,
                              child: Text(
                                '+91',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: TextField(
                                controller: cont.phoneController,
                                // keyboardType: const TextInputType.phone,
                                // maxLength: 10,
                                keyboardType: TextInputType.phone,
                                focusNode: cont.phoneFocusNode,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "8923456789",
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: const Color(0x735c6371),
                                  ),
                                  counter: null,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                onChanged: (phone) {
                                  if (phone.length == 10) {
                                    cont.phoneFocusNode.unfocus();
                                  }
                                },
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          cont.loading.value
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : InkWell(
                                  onTap: () async {
                                    if (validated(cont.phoneController.text)) {
                                      cont.loading.value = true;
                                      var response = await APIServices.isUserExists(cont.phoneController.text);
                
                                      if (response['server'] == 'error') {
                                        Fluttertoast.showToast(msg: 'Server Unavailable, Try Again Later!');
                                        cont.loading.value = false;
                                      } else if (response['userExists']) {
                                        cont.loading.value = false;
                                        Get.to(() => LoginPasswordScreen(),
                                            arguments: [
                                              cont.phoneController.text
                                            ]);
                                        // Fluttertoast.showToast(msg: 'Password');
                                      } else {
                                        // Fluttertoast.showToast(msg: 'Please Wait');
                                        await FirebaseAuth.instance
                                            .verifyPhoneNumber(
                                                verificationCompleted:
                                                    (PhoneAuthCredential
                                                        credential) {},
                                                verificationFailed:
                                                    (FirebaseAuthException e) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Something Went Wrong!, Try Again");
                                                  // Fluttertoast.showToast(
                                                  //     msg: e.toString());
                                                  // e.toString();
                                                  cont.loading.value = false;
                                                },
                                                codeSent: (String verId,
                                                    int? resendToken) {
                                                  Fluttertoast.showToast(
                                                      msg: "OTP Sent");
                                                  cont.loading.value = false;
                                                  Get.to(() => LoginOTPScreen(),
                                                      arguments: [
                                                        cont.phoneController
                                                            .text,
                                                        verId,
                                                        false
                                                      ]);
                                                },
                                                codeAutoRetrievalTimeout:
                                                    (String verificationId) {},
                                                timeout: Duration(seconds: 60),
                                                phoneNumber: '+91' +
                                                    cont.phoneController.text);
                                        // Get.to(()=>SignUp(), arguments: [cont.phoneController.text]);
                                      }
                                    }
                
                                    // Get.to(() => AddressInfo());
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
                                      'Continue',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xff333B63)),
                                    ),
                                  ),
                                ),
                        ],
                      ),
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
      Fluttertoast.showToast(msg: 'Phone number can\'t be empty');
      return false;
    }
    if (text.length != 10) {
      Fluttertoast.showToast(msg: 'Invalid Phone Number');
      return false;
    }
    return true;
  }
}