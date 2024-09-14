import 'dart:convert';
import 'dart:io';

import 'package:cfl/api/api_services.dart';
import 'package:cfl/screens/authentication/kyc/verify_selfie.dart';
import 'package:cfl/screens/authentication/occupation/business_info.dart';
import 'package:cfl/screens/authentication/occupation/employment_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/kyc/kyc_details_controller.dart';

class KYCDetails extends StatelessWidget {
  final KYCDetailsController controller = Get.put(KYCDetailsController());

  KYCDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff365EF1), Color(0xff2799EB)],
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 100),
                            Text(
                              'KYC Details',
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 70),
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
                    //       padding: EdgeInsets.all(4),
                    //       decoration: BoxDecoration(
                    //         color: Color(0x33d9d9d9),
                    //         borderRadius: BorderRadius.circular(25),
                    //       ),
                    //       child: Icon(
                    //         CupertinoIcons.back,
                    //         color: Colors.white,
                    //         size: 20,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Opacity(
                        opacity: controller.isAadhaarVerified.value ? 0.7 : 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                'Enter your Aadhaar Card Details',
                                style: GoogleFonts.poppins(
                                  color: Color(0xff333B63),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Container(
                              padding: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                color: Color(0xd304ffe),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: controller.aadharController,
                                      focusNode: controller.aadharFocusNode,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Aadhaar card number",
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: const Color(0x735c6371),
                                        ),
                                      ),
                                      enabled:
                                          controller.isAadhaarVerified.value
                                              ? false
                                              : true,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        // Add your logic to handle the text change
                                        controller.isAadhaarEntered.value =
                                            value.length == 12 ? true : false;
                                        // value.length == 14 ? controller.isAadhaarEntered.value = t
                                        if (value.length == 12) {
                                          controller.aadharFocusNode.unfocus();
                                        }
                                      },
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(12),
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                      ],
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => !controller.verifyLoading.value
                                        ? Opacity(
                                            opacity: controller
                                                    .isAadhaarEntered.value
                                                ? 1
                                                : 0.5,
                                            child: InkWell(
                                              onTap: () async {
                                                if (controller.isAadhaarEntered
                                                        .value &&
                                                    !controller
                                                        .isAadhaarVerified
                                                        .value) {
                                                  // Add your logic for sending OTP
                                                  if (controller
                                                          .aadharController
                                                          .text
                                                          .length ==
                                                      12) {
                                                    controller.verifyLoading
                                                        .value = true;
                                                    var response = await APIServices
                                                        .sendOTPForAadharNumber(
                                                            controller
                                                                .aadharController
                                                                .text);

                                                    if (response['message'] ==
                                                        'OTP Sent.') {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'OTP Sent Successully');
                                                      controller.verifyLoading
                                                          .value = false;
                                                      controller
                                                              .requestId.value =
                                                          response['data']
                                                              ['requestId'];
                                                      Get.dialog(
                                                          AadhaarOtpDialog(
                                                              controller));
                                                    } else if (response[
                                                            'message'] ==
                                                        'Something went wrong.') {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'Something went wrong');
                                                      controller.verifyLoading
                                                          .value = false;
                                                    } else {
                                                      controller.verifyLoading
                                                          .value = false;
                                                    }
                                                    // Get.dialog(AadhaarOtpDialog(controller));
                                                    // controller.isAadhaarVerified.value =
                                                    // true;
                                                  } else if (controller
                                                              .aadhaarFrontImage
                                                              .value !=
                                                          null &&
                                                      controller
                                                              .aadhaarBackImage
                                                              .value !=
                                                          null) {
                                                    controller.isAadhaarVerified
                                                        .value = true;
                                                    Fluttertoast.showToast(
                                                        msg: 'Verified');
                                                  } else {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            'Please enter valid aadhaar number');
                                                  }
                                                }
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        33, 12, 33, 12),
                                                decoration: BoxDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                    colors: [
                                                      Color(0xff2799EB),
                                                      Color(0xff1354D1),
                                                    ],
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10)),
                                                ),
                                                child: Text(
                                                  controller.isAadhaarVerified
                                                          .value
                                                      ? 'Verified'
                                                      : 'Verify',
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : const Padding(
                                            padding:
                                                EdgeInsets.only(right: 22.0),
                                            child: SizedBox(
                                                height: 13,
                                                width: 13,
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  color: Colors.blue,
                                                )),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12),
                            // _buildImagePicker(
                            //     context,
                            //     'Image of Aadhaar Card (Front)',
                            //     controller.aadhaarFrontImage,
                            //     () => controller.showPicker(
                            //         context, 'aadhaarFront'),
                            //     controller.isAadhaarVerified.value),
                            // _buildImagePicker(
                            //     context,
                            //     'Image of Aadhaar Card (Back)',
                            //     controller.aadhaarBackImage,
                            //     () => controller.showPicker(
                            //         context, 'aadhaarBack'),
                            //     controller.isAadhaarVerified.value),
                            // Obx(
                            //   () => CheckboxListTile(
                            //     title: Text(
                            //       'I give my consent for Aadhaar Verification',
                            //       style: GoogleFonts.poppins(
                            //         fontSize: 11,
                            //         fontWeight: FontWeight.w400,
                            //         color: Color(0xff333B63),
                            //       ),
                            //     ),
                            //     value: controller.isChecked.value,
                            //     onChanged: (bool? value) {
                            //       controller.isChecked.value = value!;
                            //     },
                            //     contentPadding: EdgeInsets.zero,
                            //     visualDensity: VisualDensity(horizontal: -4),
                            //     controlAffinity:
                            //         ListTileControlAffinity.leading,
                            //     activeColor: Colors.blue,
                            //   ),
                            // ),
                            SizedBox(height: 7),
                          ],
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: [
                    //     Obx(
                    //       () => controller.isAadhaarVerified.value
                    //           ? Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Icon(
                    //                   CupertinoIcons.checkmark_square_fill,
                    //                   color: Colors.green,
                    //                 ),
                    //                 SizedBox(
                    //                   width: 10,
                    //                 ),
                    //                 Text(
                    //                   'Aadhaar Verification Done',
                    //                   style: GoogleFonts.poppins(),
                    //                 ),
                    //               ],
                    //             )
                    //           : Opacity(
                    //               opacity: controller.isChecked.value ? 1 : 0.5,
                    //               child: InkWell(
                    //                 onTap: () async {
                    //                   if (controller.isChecked.value) {
                    //                     // Add your logic for sending OTP
                    //                     if (controller
                    //                             .aadharController.text.length ==
                    //                         12) {
                    //                       var response = await APIServices
                    //                           .saveAadharNumber(controller
                    //                               .aadharController.text);
                    //                       controller.isAadhaarVerified.value =
                    //                           true;
                    //                       Fluttertoast.showToast(
                    //                           msg: 'Verified');
                    //                     } else if (controller
                    //                                 .aadhaarFrontImage.value !=
                    //                             null &&
                    //                         controller.aadhaarBackImage.value !=
                    //                             null) {
                    //                       controller.isAadhaarVerified.value =
                    //                           true;
                    //                       Fluttertoast.showToast(
                    //                           msg: 'Verified');
                    //                     } else {
                    //                       Fluttertoast.showToast(
                    //                           msg:
                    //                               'Please either enter valid aadhaar number or upload aadhaar images');
                    //                     }
                    //                   }
                    //                 },
                    //                 child: Container(
                    //                   padding: const EdgeInsets.fromLTRB(
                    //                       33, 12, 33, 12),
                    //                   decoration: BoxDecoration(
                    //                     gradient: const LinearGradient(
                    //                       colors: [
                    //                         Color(0xff2799EB),
                    //                         Color(0xff1354D1),
                    //                       ],
                    //                       begin: Alignment.topRight,
                    //                       end: Alignment.bottomLeft,
                    //                     ),
                    //                     borderRadius: BorderRadius.circular(10),
                    //                   ),
                    //                   child: Text(
                    //                     'Verify',
                    //                     style: GoogleFonts.poppins(
                    //                       fontWeight: FontWeight.w600,
                    //                       fontSize: 16,
                    //                       color: Colors.white,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Enter your PAN Card Details',
                        style: GoogleFonts.poppins(
                          color: Color(0xff333B63),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Obx(
                      () => Container(
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Color(0xd304ffe),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          focusNode: controller.pANFocusNode,
                          keyboardType: controller.keyboardType.value,
                          controller: controller.panController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "PAN card number",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0x735c6371),
                            ),
                          ),
                          inputFormatters: [
                            UpperCaseTextFormatter(),
                            LengthLimitingTextInputFormatter(10)
                          ],
                          onChanged: (value) {
                            // Add your logic to handle the text change

                            if (value.length >= 5 && value.length <= 8) {
                              if (controller.keyboardType.value !=
                                  TextInputType.number) {
                                controller.keyboardType.value =
                                    TextInputType.number;
                                controller.pANFocusNode.unfocus();
                                Future.delayed(Duration(milliseconds: 100), () {
                                  controller.pANFocusNode.requestFocus();
                                });
                              }
                            } else {
                              if (controller.keyboardType.value !=
                                  TextInputType.text) {
                                controller.keyboardType.value =
                                    TextInputType.text;
                                controller.pANFocusNode.unfocus();
                                Future.delayed(Duration(milliseconds: 100), () {
                                  controller.pANFocusNode.requestFocus();
                                });
                              }
                            }

                            if (value.length == 10) {
                              controller.pANFocusNode.unfocus();
                            }
                            // if (value.length >= 5 && value.length <= 9) {
                            //   controller.isPANLengthBetween5to9.value = true;
                            //   controller.keyboardType.value = TextInputType.number;
                            // } else {
                            //   controller.isPANLengthBetween5to9.value = false;
                            //   controller.keyboardType.value = TextInputType.text;
                            // }
                            // // Refocus the text field to apply the new keyboard type

                            // if(value.length>=5 && value.length<=9){
                            //   controller.isPANLengthBetween5to9.value = true;
                            //   controller.pANFocusNode.unfocus();
                            //   print('done');
                            //   controller.pANFocusNode.requestFocus();
                            // }else{
                            //   print('done not');
                            //   controller.isPANLengthBetween5to9.value = false;
                            // }
                          },
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => controller.panName.value != ''
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 13.0, left: 13),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        controller.panName.value !=
                                                controller.name.value
                                                    .toUpperCase()
                                            ? Icons.error_outline
                                            : CupertinoIcons
                                                .check_mark_circled_solid,
                                        color: controller.panName.value !=
                                                controller.name.value
                                                    .toUpperCase()
                                            ? Colors.red
                                            : Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Name in PAN: ${controller.panName.value}'),
                                          // Text(controller.panName.value !=
                                          //         controller.name.value
                                          //             .toUpperCase()
                                          //     ? 'Name in PAN: ${controller.panName.value}'
                                          //     : controller.panName.value),

                                          // controller.panName.value !=
                                          //         controller.name.value
                                          //             .toUpperCase()
                                          //     ? Row(
                                          //         children: [
                                          //           Text(
                                          //               'Name in Profile: ${controller.name.value.toUpperCase()}'),
                                          //           InkWell(
                                          //               onTap: () {
                                          //                 Get.dialog(
                                          //                     NameUpdateDialog(
                                          //                         controller));
                                          //               },
                                          //               child: Icon(
                                          //                 Icons.edit,
                                          //                 size: 15,
                                          //                 color: Colors.blue,
                                          //               ))
                                          //         ],
                                          //       )
                                          //     : SizedBox(),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // controller.panName.value !=
                                  //         controller.name.value.toUpperCase()
                                  //     ? Text(
                                  //         'PAN Name and Profile Name must be same!',
                                  //         style:
                                  //             GoogleFonts.poppins(fontSize: 10),
                                  //       )
                                  //     : SizedBox()
                                ],
                              ),
                            )
                          : SizedBox(),
                    ),
                    SizedBox(height: 22),
                    // _buildImagePicker(
                    //     context,
                    //     'Image of PAN Card',
                    //     controller.panImage,
                    //     () => controller.showPicker(context, 'pan'),
                    //     controller.isPanVerified.value),
                    // SizedBox(height: 18),
                    Obx(
                      () => !controller.isAadhaarVerified.value
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 18,
                                  width: 18,
                                  color: Color(0xffF4B442),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Please verify your Aadhaar Number first.',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Color(0xffF4B442),
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(),
                    ),
                    SizedBox(height: 38),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => Opacity(
                            opacity: controller.isAadhaarVerified.value &&
                                    controller.panController.text.length == 10
                                ? 1
                                : 0.5,
                            child: InkWell(
                              onTap: () async {
                                //pan validations
                                if (controller.isAadhaarVerified.value) {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  if (controller.panController.text.length ==
                                      10) {
                                    var response = await APIServices.verifyPAN(
                                        controller.panController.text);
                                    // String jsonData = response['data'];
                                    print(response['data']);
                                    print(response['data']['result']);
                                    print(response['data']['result']['name']);
                                    // var parsedJson = jsonDecode(response['data']);
                                    if (response['data']['result']['name'] !=
                                        null) {
                                      controller.panName.value =
                                          response['data']['result']['name'];
                                      // if (controller.panName.value ==
                                      //     controller.name.value.toUpperCase()) {
                                        if (controller.occupation.value == 'Salaried Employee') {
                                          prefs.setBool('isKYCSaved', true);
                                          Get.off(() => EmploymentInfo());
                                        } else if (controller
                                                .occupation.value ==
                                            'Student') {
                                          prefs.setBool('isKYCSaved', true);
                                          prefs.setBool(
                                              'isOccupationDetailsSaved', true);
                                          Get.off(
                                              () => VerifyYourselfWithSelfie());
                                        } else {
                                          prefs.setBool('isKYCSaved', true);
                                          Get.off(() => BusinessInfo());
                                        }
                                      // }
                                    }
                                  }
                                  // else if (controller.panImage.value !=
                                  //     null) {
                                  //   if (controller.occupation.value ==
                                  //       'Salaried Employee') {
                                  //     prefs.setBool('isKYCSaved', true);
                                  //     Get.off(() => EmploymentInfo());
                                  //   } else if (controller.occupation.value ==
                                  //       'Student') {
                                  //     prefs.setBool('isKYCSaved', true);
                                  //     prefs.setBool(
                                  //         'isOccupationDetailsSaved', true);
                                  //     Get.off(() => VerifyYourselfWithSelfie());
                                  //   } else {
                                  //     prefs.setBool('isKYCSaved', true);
                                  //     Get.off(() => BusinessInfo());
                                  //   }
                                  // }
                                  else {
                                    Fluttertoast.showToast(
                                        msg: 'Please enter PAN Card Number');
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
                                      Color(0xff1354D1),
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Continue',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
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

  Widget _buildImagePicker(
    BuildContext context,
    String title,
    Rxn<File> imageFile,
    VoidCallback onPick,
    bool value,
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
          InkWell(
            onTap: () {
              if (!value) {
                onPick();
              } else {}
            },
            child: Container(
              padding: EdgeInsets.all(28),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xd304ffe),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (imageFile.value == null)
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
                      )
                    else
                      Image.file(
                        imageFile.value!,
                        height: 100, // Adjust the height as needed
                        width: double.infinity,
                        fit: BoxFit.contain,
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

class AadhaarOtpDialog extends StatelessWidget {
  final KYCDetailsController controller;

  AadhaarOtpDialog(this.controller);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Color(0xff365EF1), Color(0xff2799EB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Icon(
                CupertinoIcons.checkmark_seal_fill,
                color: Colors.white,
                size: 40,
              ),
            ),
            Text('Enter OTP', style: GoogleFonts.poppins(fontSize: 18.0)),
            SizedBox(height: 16.0),
            Container(
              width: 200,
              decoration: BoxDecoration(
                color: Color(0xd304ffe),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: controller.otpController,
                focusNode: controller.otpFocusNode,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "OTP",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0x735c6371),
                  ),
                ),
                inputFormatters: [LengthLimitingTextInputFormatter(6)],
                // onChanged: (value) => ,
                onChanged: (value) {
                  controller.otp.value = value;
                  if (value.length == 6) {
                    controller.otpFocusNode.unfocus();
                  }
                },
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : InkWell(
                    onTap: () async {
                      if (controller.otp.value.length == 6) {
                        controller.verifyOtp();
                      } else if (controller.otp.value.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'OTP Field Cannot Be Empty');
                      } else {
                        Fluttertoast.showToast(
                            msg: 'OTP Contains at least 6 digits');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(33, 12, 33, 12),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff2799EB),
                            Color(0xff1354D1),
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Verify',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class NameUpdateDialog extends StatelessWidget {
  final KYCDetailsController controller;

  NameUpdateDialog(this.controller);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            // ShaderMask(
            //   shaderCallback: (bounds) => LinearGradient(
            //     colors: [Color(0xff365EF1), Color(0xff2799EB)],
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //   ).createShader(bounds),
            //   child: Icon(
            //     CupertinoIcons.checkmark_seal_fill,
            //     color: Colors.white,
            //     size: 40,
            //   ),
            // ),
            Text('Update name in profile',
                style: GoogleFonts.poppins(fontSize: 18.0)),
            SizedBox(height: 16.0),
            Container(
              width: 224,
              decoration: BoxDecoration(
                color: Color(0xd304ffe),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: controller.nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Name Here",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0x735c6371),
                  ),
                ),
                inputFormatters: [LengthLimitingTextInputFormatter(6),
                  FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))],
                // onChanged: (value) => ,
                onChanged: (value) {
                  controller.otp.value = value;
                  if (value.length == 6) {
                    controller.otpFocusNode.unfocus();
                  }
                },
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : InkWell(
                    onTap: () async {
                      if (controller.nameController.text.isNotEmpty) {
                        // controller.verifyOtp();
                      } else if (controller.nameController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'Name Field Cannot Be Empty');
                      } else {
                        // Fluttertoast.showToast(
                        //     msg: 'OTP Contains at least 6 digits');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(33, 12, 33, 12),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff2799EB),
                            Color(0xff1354D1),
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Update Name',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
