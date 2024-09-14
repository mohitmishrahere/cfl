import 'package:cfl/api/api_services.dart';
import 'package:cfl/controllers/auth/login_password.dart';
import 'package:cfl/screens/authentication/contacts.dart';
import 'package:cfl/screens/authentication/signup/sign_up_address_info.dart';
import 'package:cfl/screens/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../permissions/permissions.dart';
import 'kyc/kyc_info.dart';
import 'kyc/verify_selfie.dart';
import 'login_otp.dart';
import 'occupation/business_info.dart';
import 'occupation/employment_info.dart';

class LoginPasswordScreen extends StatefulWidget {
  const LoginPasswordScreen({super.key});

  @override
  State<LoginPasswordScreen> createState() => _LoginPasswordScreenState();
}

class _LoginPasswordScreenState extends State<LoginPasswordScreen> {
  bool _obscureText = true;
  final LoginPasswordController cont = Get.put(LoginPasswordController());

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .63,
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
                        bottom: 10,
                        child: Image.asset(
                          'assets/images/loginPassword.png',
                          scale: 1.6,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Password !',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffFDBC0E),
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Password',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      // height: 50,
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: cont.password,
                              obscureText: _obscureText,
                              obscuringCharacter: '⬤',
                              // Use a bullet character as placeholder
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: !_obscureText
                                      ? Colors.black
                                      : const Color(0xff5C6371),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          IconButton(
                            icon: Image.asset(
                              !_obscureText
                                  ? 'assets/images/eyeOpen.png'
                                  : 'assets/images/eyeClosed.png',
                              color: Colors.grey,
                              width: 22.17,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(
                          () => cont.forgotLoading.value
                              ? SizedBox(
                                  height: 13,
                                  width: 13,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ))
                              : InkWell(
                                  onTap: () async {
                                    cont.forgotLoading.value = true;
                                    await FirebaseAuth.instance
                                        .verifyPhoneNumber(
                                            verificationCompleted:
                                                (PhoneAuthCredential
                                                    credential) {},
                                            verificationFailed:
                                                (FirebaseAuthException e) {
                                              cont.forgotLoading.value = false;
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
                                              cont.forgotLoading.value = false;
                                              Get.to(() => LoginOTPScreen(),
                                                  arguments: [
                                                    cont.mobile.value,
                                                    verId,
                                                    true
                                                  ]);
                                            },
                                            codeAutoRetrievalTimeout:
                                                (String verificationId) {},
                                            timeout:
                                                const Duration(seconds: 60),
                                            phoneNumber:
                                                '+91${cont.mobile.value}');
                                  },
                                  child: Text(
                                    'Forgot Password',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          cont.loading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : InkWell(
                                  onTap: () async {
                                    if (validated(cont.password.text)) {
                                      cont.loading.value = true;
                                      var response = await APIServices.login(
                                          cont.mobile.value,
                                          cont.password.text);
                                      if (response['message'] ==
                                          'Inavalid credentials') {
                                        Fluttertoast.showToast(
                                            msg: 'Incorrect Password');
                                        cont.loading.value = false;
                                      } else if (response['message'] ==
                                          'Signin successful.') {
                                        SessionManager sessionManager =
                                            SessionManager();
                                        await sessionManager.set(
                                            'authToken', response['authtoken']);
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();

                                        prefs.setString(
                                            'token', response['authtoken']);

                                        var responseProfile = await APIServices.getProfile();
                                        var data = responseProfile['data'];
                                        if (data['email'] != null) {
                                          prefs.setString('email', data['email']);
                                        }

                                        if (data['name'] != null) {
                                          prefs.setString('name', data['name']);
                                        }
                                        if (data['profilepic'] != null) {
                                          prefs.setString('profilePic',
                                              data['profilepic']);
                                        }
                                        if (data['occupation_status'] == 'business') {
                                          prefs.setString('occupation', 'Business');
                                        } else if (data['occupation_status'] == 'student') {
                                          prefs.setString('occupation', 'Student');
                                        } else {
                                          prefs.setString('occupation', 'Salaried Employee');
                                        }
                                        if (data['address'] != null) {
                                          prefs.setBool('isAddressSaved', true);
                                        }
                                        if (data['aadharVerified'] != false && data['panVerified'] != false) {
                                          prefs.setBool('isKYCSaved', true);
                                        }

                                        if (data['occupation'] != null) {
                                          prefs.setBool('isOccupationDetailsSaved', true);
                                        }
                                        if (data['profilepic'] != null) {
                                          prefs.setBool('isPhotoUploaded', true);
                                        }
                                        if (data['emergency_contacts'].isNotEmpty) {
                                          prefs.setBool('emergencyContact', true);
                                          prefs.setBool('isEmergencyContactAdded', true);
                                        }

                                        bool isAddressSaved = prefs.getBool('isAddressSaved') ?? false;
                                        bool isKYCSaved = prefs.getBool('isKYCSaved') ?? false;
                                        bool isOccupationDetailsSaved = prefs.getBool('isOccupationDetailsSaved') ?? false;
                                        bool isPhotoUploaded = prefs.getBool('isPhotoUploaded') ?? false;
                                        bool isEmergencyContactAdded = prefs.getBool('isEmergencyContactAdded') ?? false;

                                        if (!isAddressSaved) {
                                          Get.offAll(() => AddressInfo());
                                        }
                                        else if (!isKYCSaved) {
                                          Get.offAll(() => KYCInfo());
                                        }
                                        else if (!isOccupationDetailsSaved && data['occupation_status'] != 'student') {
                                          String? occupation = prefs.getString('occupation');
                                          if (occupation == 'Business') {
                                            Get.offAll(() => BusinessInfo());
                                          } else {
                                            Get.offAll(() => EmploymentInfo());
                                          }
                                        } else if (!isPhotoUploaded) {
                                          Get.offAll(() => VerifyYourselfWithSelfie());
                                        } else if (!isEmergencyContactAdded) {
                                          Get.offAll(() => ReferenceContact());
                                        }
                                      else {
                                          prefs.setBool('isLoggedIn', true);
                                          Get.offAll(() => MainScreen(),
                                              arguments: [
                                                prefs.getString('name') ?? 'User',
                                                prefs.getString('profilePic') ?? 'User'
                                              ]);
                                        }

                                        // Get.off(() => PermissionsScreen(), arguments: [false]);
                                        // Get.to(()=>HomeScreen());
                                      }
                                      print(response);
                                    }
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
                                      'Login',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: const Color(0xff333B63)),
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
      Fluttertoast.showToast(msg: 'Password field can\'t be empty');
      return false;
    } else if (text.length < 8) {
      Fluttertoast.showToast(
          msg: 'Password must contain at least 8 characters');
      return false;
    }
    return true;
  }
}
