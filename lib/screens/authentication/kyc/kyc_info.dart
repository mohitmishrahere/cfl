import 'package:cfl/controllers/auth/login_otp_controller.dart';
import 'package:cfl/controllers/sign_up_controller.dart';
import 'package:cfl/screens/authentication/kyc/otp_kyc.dart';
import 'package:cfl/screens/authentication/kyc/video_kyc.dart';
import 'package:cfl/widgets/pin_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../controllers/address_controller.dart';
import '../../../controllers/kyc/kyc_controller.dart';

class KYCInfo extends StatelessWidget {
  KYCInfo({super.key});

  final KYCInfoController cont = Get.put(KYCInfoController());

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
                                'KYC Info',
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'We need to verify your KYC\nto get you along with us',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 50,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Residence
                    Text(
                      'Choose KYC Verification Mode',
                      style: GoogleFonts.poppins(
                          color: Color(0xff333B63),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Choose from following KYC Modes you want to continue with for KYC Verification',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: Color(0xff333B63),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 7,
                    ),

                    Obx(
                      () => Column(
                        children: [
                          SizedBox(height: 17,),
                          InkWell(
                            onTap:(){
                              cont.selectedKYCMode.value = 'OTP';
                            },
                            child: Stack(
                              children: [
                                Container(
                                  padding:EdgeInsets.only(left: 27, top: 45, right: 27, bottom: 25),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xd365ef1),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('KYC Verification\nthrough OTP', style: GoogleFonts.poppins(fontSize: 18, fontWeight:FontWeight.w600, color:Color(0xff333B63)),),
                                            SizedBox(height: 7,),
                                            Text('Estimated time: 15 mins.', style: GoogleFonts.poppins(fontSize: 12, fontWeight:FontWeight.w500, color:Color(0xff333B63)),)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RadioListTile<String>(
                                  // contentPadding: EdgeInsets.zero,
                                  visualDensity: VisualDensity(horizontal: -4),
                                  title: Text(
                                    '',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff344054)),
                                  ),
                                  activeColor: Color(0xff365EF1),
                                  value: 'OTP',
                                  groupValue: cont.selectedKYCMode.value,
                                  onChanged: (String? value) {
                                    cont.selectedKYCMode.value = value!;
                                  },
                                ),
                                Positioned(
                                    right:27,
                                    top:0,
                                    bottom:0,child: Image.asset('assets/images/otp.png', width: 66, height: 66,))
                              ],
                            ),
                          ),
                          // SizedBox(height: 30,),
                          // InkWell(
                          //   onTap:(){
                          //     cont.selectedKYCMode.value = 'Video';
                          //   },
                          //   child: Stack(
                          //     children: [
                          //       Container(
                          //         padding:EdgeInsets.only(left: 27, top: 45, right: 27, bottom: 25),
                          //         width: MediaQuery.of(context).size.width,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(8),
                          //           color: Color(0xd365ef1),
                          //         ),
                          //         child: Row(
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: [
                          //             Expanded(
                          //               child: Column(
                          //                 crossAxisAlignment: CrossAxisAlignment.start,
                          //                 children: [
                          //                   Text('KYC Verification\nthrough Video', style: GoogleFonts.poppins(fontSize: 18, fontWeight:FontWeight.w600, color:Color(0xff333B63)),),
                          //                   SizedBox(height: 7,),
                          //                   Text('Estimated time: 10 mins.', style: GoogleFonts.poppins(fontSize: 12, fontWeight:FontWeight.w500, color:Color(0xff333B63)),)
                          //                 ],
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //       RadioListTile<String>(
                          //         // contentPadding: EdgeInsets.zero,
                          //         visualDensity: VisualDensity(horizontal: -4),
                          //         title: Text(
                          //           '',
                          //           style: GoogleFonts.poppins(
                          //               fontSize: 14,
                          //               fontWeight: FontWeight.w500,
                          //               color: Color(0xff344054)),
                          //         ),
                          //         activeColor: Color(0xff365EF1),
                          //         value: 'Video',
                          //         groupValue: cont.selectedKYCMode.value,
                          //         onChanged: (String? value) {
                          //           cont.selectedKYCMode.value = value!;
                          //         },
                          //       ),
                          //       Positioned(
                          //           right:27,
                          //           top:0,
                          //           bottom:0,child: Image.asset('assets/images/video.png', width: 66, height: 66,))
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 38,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){
                            if(cont.selectedKYCMode.value=='OTP'){
                              Get.off(()=>OTPKYC());
                            }else{
                              Get.off(()=>VideoKYC());
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(33, 12, 33, 12),
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
}
