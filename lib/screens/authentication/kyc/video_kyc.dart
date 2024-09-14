import 'package:cfl/controllers/auth/login_otp_controller.dart';
import 'package:cfl/controllers/sign_up_controller.dart';
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
import '../../../controllers/kyc/otp_kyc_controller.dart';
import '../../../controllers/kyc/video_kyc_controller.dart';
import 'kyc_details.dart';

class VideoKYC extends StatelessWidget {
  VideoKYC({super.key});

  final VideoKYCController cont = Get.put(VideoKYCController());

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
                                textAlign: TextAlign.center,
                                'Complete\nYour KYC Video\nVerification',
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 40,
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
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x21212114),
                            // Hex color with opacity
                            offset: Offset(0, 4),
                            // Equivalent to "0px 4px" in CSS
                            blurRadius: 12, // Equivalent to "12px" in CSS
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'We\'ll Need The Following:',
                            style: GoogleFonts.poppins(
                                color: Color(0xff333B63),
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF8F8F8),
                                      borderRadius: BorderRadius.circular(4)),
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                    'assets/images/video.png',
                                    width: 37,
                                  )),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Original PAN card',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Color(0xff333B63)),
                                    ),
                                    Text(
                                      'You need to have your original PAN card by your side',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0xff333B63)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffF8F8F8),
                                    borderRadius: BorderRadius.circular(4)),
                                width: 40,
                                height: 40,
                                child: Image.asset(
                                  'assets/images/video.png',
                                  width: 37,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Aadhaar Number',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Color(0xff333B63)),
                                    ),
                                    Text(
                                      'You need to provide your Aadhaar number & have access to the mobile number linked with Aadhaar',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0xff333B63)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    Text(
                      'Steps to be followed:',
                      style: GoogleFonts.poppins(
                          color: Color(0xff333B63),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Step 1 - Verify Aadhaar using OTP',
                      style: GoogleFonts.poppins(
                          color: Color(0xff333B63),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 7,),
                    Text(
                      '•  Enter your Aadhaar number. \n'
                          '•  Request OTP to the mobile number linked with \n   Aadhaar. \n'
                          '•  Verify Aadhaar using OTP.',
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Color(0xff333B63)),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Step 2 - Video Verification',
                      style: GoogleFonts.poppins(
                          color: Color(0xff333B63),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 7,),
                    Text(
                      '•  Complete the video verification as soon as you\n    complete Step 1.',
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Color(0xff333B63)),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.off(()=>KYCDetails());
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
                              'Get Started',
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
