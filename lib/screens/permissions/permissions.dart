import 'package:cfl/controllers/auth/permissions_controller.dart';
import 'package:cfl/controllers/auth/permissions_controller.dart';
import 'package:cfl/controllers/kyc/verify_selfie_controller.dart';
import 'package:cfl/screens/authentication/kyc/camera/camera_screen.dart';
import 'package:cfl/screens/authentication/signup/sign_up_address_info.dart';
import 'package:cfl/screens/main/main_screen.dart';
import 'package:cfl/screens/tnc-privacy/privacy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/occupation/business_info_controller.dart';
import '../../../service/permission_service.dart';
import '../../api/api_services.dart';
import '../authentication/contacts.dart';
import '../authentication/kyc/kyc_info.dart';
import '../authentication/kyc/verify_selfie.dart';
import '../authentication/login_phone.dart';
import '../authentication/occupation/business_info.dart';
import '../authentication/occupation/employment_info.dart';
import '../tnc-privacy/terms_and_condition.dart';

class PermissionsScreen extends StatelessWidget {
  PermissionsScreen({super.key});

  final PermissionsController cont = Get.put(PermissionsController());
  final PermissionsService _permissionsService = PermissionsService();

  @override
  Widget build(BuildContext context) {
    // pinController.text = '______';
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  // height: MediaQuery.of(context).size.height * .63,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                      // color: Colors.white,
                      gradient: LinearGradient(
                        colors: [Color(0xff365EF1), Color(0xff2799EB)],
                        begin: Alignment.centerLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 90,
                              ),
                              Text(
                                'Allow Permissions',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'We need the following permissions',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PermissionTile(
                      icon: Icons.camera_alt,
                      title: 'Camera',
                      description:
                          'CFL needs camera access to capture required documents for loan verification.',
                    ),
                    PermissionTile(
                      icon: Icons.mic,
                      title: 'Microphone',
                      description:
                          'CFL requires microphone permission to facilitate audio verification calls.',
                    ),
                    PermissionTile(
                      icon: Icons.perm_media,
                      title: 'Media',
                      description:
                          'CFL requires access to your media files to upload documents and images for loan processing.',
                    ),
                    PermissionTile(
                      icon: Icons.sd_storage,
                      title: 'Storage',
                      description:
                          'CFL needs access to your device storage to save and retrieve files related to loan applications.',
                    ),
                    PermissionTile(
                      icon: Icons.contacts,
                      title: 'Contacts',
                      description:
                          'CFL requires access to your contacts to verify your references during the loan application process.',
                    ),
                    Obx(
                      () => CheckboxListTile(
                        title: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'I agree with the Permissions, ',
                                style:
                                    GoogleFonts.poppins(color: Colors.black)),
                            TextSpan(
                              text: 'Terms and Conditions ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  // Navigate to Terms and Conditions screen
                                  var result =
                                      await Get.to(() => TermsAndConditions());
                                  if (result != null) {
                                    cont.isChecked.value = true;
                                  }
                                },
                            ),
                            TextSpan(
                                text: 'and',
                                style:
                                    GoogleFonts.poppins(color: Colors.black)),
                            TextSpan(
                              text: ' Privacy Policy.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  // Navigate to Terms and Conditions screen
                                  var result =
                                      await Get.to(() => PrivacyPolicy());
                                  if (result != null) {
                                    cont.isChecked.value = true;
                                  }
                                },
                            ),

                            // Text(
                            //   'Mark Permanent address same as residence',
                            //   style: GoogleFonts.poppins(
                            //       fontSize: 11,
                            //       fontWeight: FontWeight.w400,
                            //       color: Color(0xff333B63)),
                            // ),
                          ]),
                        ),
                        value: cont.isChecked.value,
                        onChanged: (bool? value) {
                          cont.isChecked.value = value!;
                        },
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity(horizontal: -4),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () async {
                        if (cont.isChecked.value) {
                          await _permissionsService.requestPermissions();
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool('isT&CAccepted', true);
                          Get.off(()=>LoginPhoneScreen());
                          // if (cont.isSignup.value) {
                          //   var response = await APIServices.acceptTnC();
                          //   SharedPreferences prefs =
                          //   await SharedPreferences.getInstance();
                          //   prefs.setBool('isT&CAccepted', true);
                          //   Get.off(() => AddressInfo());
                          // } else {
                          //   var responseProfile = await APIServices.getProfile();
                          //   SharedPreferences prefs = await SharedPreferences.getInstance();
                          //   if (responseProfile['data']['email'] != null) {
                          //     prefs.setString(
                          //         'email', responseProfile['data']['email']);
                          //   }
                          //
                          //   if (responseProfile['data']['name'] != null) {
                          //     prefs.setString(
                          //         'name', '${responseProfile['data']['name']}');
                          //   }
                          //   if (responseProfile['data']['profilepic'] != null) {
                          //     prefs.setString('profilePic',
                          //         responseProfile['data']['profilepic']);
                          //   }
                          //   if (responseProfile['data']['occupation_status'] ==
                          //       'business') {
                          //     prefs.setString('occupation', 'Business');
                          //   } else if (responseProfile['data']
                          //   ['occupation_status'] ==
                          //       'student') {
                          //     prefs.setString('occupation', 'Student');
                          //   } else {
                          //     prefs.setString('occupation', 'Salaried Employee');
                          //   }
                          //   // if (responseProfile['data']['termsandconditions'] !=
                          //   //     false) {
                          //   //   Fluttertoast.showToast(
                          //   //       msg: responseProfile['data']
                          //   //       ['termsandconditions']);
                          //   //   prefs.setBool('isT&CAccepted', true);
                          //   //   var status =
                          //   //       prefs.getBool('isT&CAccepted') ?? false;
                          //   //   Fluttertoast.showToast(msg: status.toString());
                          //   // }
                          //   if (responseProfile['data']['address'] != null) {
                          //     prefs.setBool('isAddressSaved', true);
                          //   }
                          //   if (responseProfile['data']['aadharVerified'] !=
                          //       false &&
                          //       responseProfile['data']['panVerified'] != false) {
                          //     prefs.setBool('isKYCSaved', true);
                          //   }
                          //
                          //   if (responseProfile['data']['occupation'] != null) {
                          //     prefs.setBool('isOccupationDetailsSaved', true);
                          //   }
                          //   if (responseProfile['data']['profilepic'] != null) {
                          //     prefs.setBool('isPhotoUploaded', true);
                          //   }
                          //   if (responseProfile['data']['emergency_contacts']
                          //       .isNotEmpty) {
                          //     prefs.setBool('emergencyContact', true);
                          //     prefs.setBool('isEmergencyContactAdded', true);
                          //   }
                          //
                          //   bool isAddressSaved =
                          //       prefs.getBool('isAddressSaved') ?? false;
                          //   bool isKYCSaved =
                          //       prefs.getBool('isKYCSaved') ?? false;
                          //   bool isOccupationDetailsSaved =
                          //       prefs.getBool('isOccupationDetailsSaved') ??
                          //           false;
                          //   bool isPhotoUploaded =
                          //       prefs.getBool('isPhotoUploaded') ?? false;
                          //   bool isT_and_CAccepted =
                          //       prefs.getBool('isT&CAccepted') ?? false;
                          //   bool isEmergencyContactAdded =
                          //       prefs.getBool('isEmergencyContactAdded') ?? false;
                          //
                          //   if (!isAddressSaved) {
                          //     Get.offAll(() => AddressInfo());
                          //   } else if (!isKYCSaved) {
                          //     Get.offAll(() => KYCInfo());
                          //   } else if (!isOccupationDetailsSaved &&
                          //       responseProfile['data']['occupation_status'] !=
                          //           'student') {
                          //     String? occupation = prefs.getString('occupation');
                          //     print(occupation);
                          //     if (occupation == 'Business') {
                          //       Get.offAll(() => BusinessInfo());
                          //     } else {
                          //       Get.offAll(() => EmploymentInfo());
                          //     }
                          //   } else if (!isPhotoUploaded) {
                          //     Get.offAll(() => VerifyYourselfWithSelfie());
                          //   } else if (!isEmergencyContactAdded) {
                          //     Get.offAll(() => ReferenceContact());
                          //   } else {
                          //     prefs.setBool('isLoggedIn', true);
                          //     Get.offAll(() => MainScreen(), arguments: [
                          //       prefs.getString('name') ?? 'User',
                          //       prefs.getString('profilePic') ?? 'User'
                          //     ]);
                          //   }
                          // }
                        } else {
                          Fluttertoast.showToast(
                              msg:
                                  'Please accept the Terms and Conditions and Privacy Policy to continue');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(33, 12, 33, 12),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xff2799EB), Color(0xff1354D1)],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Allow Permissions',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        ),
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
}

class PermissionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  PermissionTile(
      {required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Color(0xff365EF1), Color(0xff2799EB)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Icon(icon, size: 35, color: Colors.white),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
