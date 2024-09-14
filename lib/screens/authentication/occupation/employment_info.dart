import 'dart:ffi';
import 'dart:io';

import 'package:cfl/controllers/auth/login_otp_controller.dart';
import 'package:cfl/controllers/sign_up_controller.dart';
import 'package:cfl/screens/authentication/kyc/kyc_info.dart';
import 'package:cfl/widgets/pin_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/api_services.dart';
import '../../../controllers/occupation/employment_info_controller.dart';
import '../kyc/verify_selfie.dart';

class EmploymentInfo extends StatelessWidget {
  EmploymentInfo({super.key});

  final EmploymentInfoController cont = Get.put(EmploymentInfoController());

  @override
  Widget build(BuildContext context) {
    // pinController.text = '______';
    return Scaffold(
      body: GetBuilder<EmploymentInfoController>(
          builder: (controller) {
            return Container(
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
                                  SizedBox(
                                    height: 90,
                                  ),
                                  Text(
                                    'Employment Info',
                                    style: GoogleFonts.poppins(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Tell us following details about\nyour Employment',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 70,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Positioned(
                          //   left: 30,
                          //   top: 75,
                          //   child: InkWell(
                          //     onTap: () {
                          //       Get.back();
                          //     },
                          //     child: Container(
                          //         padding: EdgeInsets.all(4),
                          //         decoration: BoxDecoration(
                          //             color: Color(0x33d9d9d9),
                          //             borderRadius: BorderRadius.circular(25)),
                          //         child: Icon(
                          //           CupertinoIcons.back,
                          //           color: Colors.white,
                          //           size: 20,
                          //         )),
                          //   ),
                          // ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Residence
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            'Office Name',
                            style: GoogleFonts.poppins(
                                color: Color(0xff333B63),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Color(0xd304ffe),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              controller: cont.shopName,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "john doe",
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: const Color(0x735c6371),
                                ),
                              ),
                              // keyboardType: TextInputType.number,
                              onChanged: (_) {
                                if (_.isNotEmpty &&
                                    cont.shopAddress.text.isNotEmpty &&
                                    cont.pincode.text.length == 6) {
                                  cont.allFieldsEntered.value = true;
                                } else {
                                  cont.allFieldsEntered.value = false;
                                }
                              },
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            )),
                        SizedBox(
                          height: 22,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            'Office Address',
                            style: GoogleFonts.poppins(
                                color: Color(0xff333B63),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                            height: 130,
                            padding: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Color(0xd304ffe),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              controller: cont.shopAddress,

                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Office Address Here",
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: const Color(0x735c6371),
                                ),
                              ),
                              // keyboardType: TextInputType.number,
                              onChanged: (_) {
                                if (_.isNotEmpty &&
                                    cont.shopName.text.isNotEmpty &&
                                    cont.pincode.text.length == 6) {
                                  cont.allFieldsEntered.value = true;
                                } else {
                                  cont.allFieldsEntered.value = false;
                                }
                              },
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            )),
                        SizedBox(
                          height: 22,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            'Office Pincode',
                            style: GoogleFonts.poppins(
                                color: Color(0xff333B63),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Color(0xd304ffe),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              controller: cont.pincode,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Office Pincode here",
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: const Color(0x735c6371),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (_) {
                                if (_.length == 6 &&
                                    cont.shopName.text.isNotEmpty &&
                                    cont.shopAddress.text.isNotEmpty) {
                                  cont.allFieldsEntered.value = true;
                                } else {
                                  cont.allFieldsEntered.value = false;
                                }
                              },
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            )),
                        SizedBox(
                          height: 12,
                        ),

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildImagePicker(
                                  context,
                                  'Proof of Validation (Office ID/Salary Slip)',
                                  cont.poV,
                                  () => cont.showPicker(context),
                                  cont),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 28,
                        ),

                        Obx(()=> Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              cont.isLoading.value ? CircularProgressIndicator() : Opacity(
                                opacity: cont.isUploaded.value &&
                                        cont.allFieldsEntered.value
                                    ? 1.0
                                    : 0.5,
                                child: InkWell(
                                  onTap: () async {
                                    if (cont.isUploaded.value) {
                                      cont.isLoading.value = true;
                                      var response =
                                          await APIServices.saveOccupationInfo(
                                              false,
                                              cont.shopName.text,
                                              cont.shopAddress.text,
                                              cont.pincode.text,
                                              cont.uploadedImageAddress.value);
                                      if (response.containsKey('message') &&
                                          response['message'] ==
                                              'Information saved successfully') {
                                        cont.isLoading.value = false;
                                        Fluttertoast.showToast(msg: 'Successfull');

                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                        prefs.setBool('isOccupationDetailsSaved', true);

                                        Get.off(() => VerifyYourselfWithSelfie());
                                      }
                                    }
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(33, 12, 33, 12),
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xff2799EB),
                                            Color(0xff1354D1)
                                          ],
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                        ),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Text(
                                      'Continue',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
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
          );
        }
      ),
    );
  }

  Widget _buildImagePicker(
    BuildContext context,
    String title,
    Rxn<File> imageFile,
    VoidCallback onPick,
    EmploymentInfoController cont,
  ) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 17),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                color: Color(0xff333B63),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 7),
          cont.isUploadingImage.value
              ? Container(
                  padding: EdgeInsets.all(28),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xd304ffe),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 130,
                  child: Center(child: CircularProgressIndicator()))
              : InkWell(
                  onTap: onPick,
                  child: Container(
                    padding: EdgeInsets.all(28),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xd304ffe),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(
                      () => Column(
                        children: [
                          if (imageFile.value != null && cont.isUploaded.value)
                            Image.file(
                              imageFile.value!,
                              height: 100, // Adjust the height as needed
                              width: double.infinity,
                              fit: BoxFit.contain,
                            )
                          else
                            Column(
                              children: [
                                Icon(
                                  CupertinoIcons.cloud_upload,
                                  size: 22,
                                  color: Color(0xff363130),
                                ),
                                Text(
                                  'Upload a verification document.',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Color(0xff333B63),
                                  ),
                                ),
                                Text(
                                  'File size: Less than 2mb',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Color(0xff333B63),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
