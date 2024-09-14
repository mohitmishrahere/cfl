import 'package:cfl/controllers/kyc/verify_selfie_controller.dart';
import 'package:cfl/screens/authentication/kyc/camera/camera_screen.dart';
import 'package:cfl/screens/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/occupation/business_info_controller.dart';
import '../../../service/permission_service.dart';
import 'notification.dart';

class LoanApplication extends StatelessWidget {
  LoanApplication({super.key});

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
                  // height: MediaQuery.of(context).size.height * .2,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(25, 80, 25, 60),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: const Color(0x33d9d9d9),
                                borderRadius: BorderRadius.circular(25)),
                            child: const Icon(
                              CupertinoIcons.back,
                              color: Colors.white,
                              size: 20,
                            )),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Loan Application',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          Get.to(() => NotificationScreen());
                        },
                        child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                                color: Color(0xffF2EACB),
                                borderRadius:
                                BorderRadius.circular(25.71)),
                            child: Image.asset(
                              'assets/icons/notification.png',
                              // height: 8,
                              // width: 4,
                              scale: 2,
                              color: Color(0xff333B63),
                            )),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LoanApplicationWidget(
                        context,
                        'assets/images/video.png',
                        'KYC Information',
                        'Upload your KYC ID and enter other details',
                        55),
                    SizedBox(
                      height: 20,
                    ),
                    LoanApplicationWidget(
                        context,
                        'assets/images/video.png',
                        'Personal Information',
                        'Provide details about yourself and family',
                        0),
                    SizedBox(
                      height: 20,
                    ),
                    LoanApplicationWidget(context, 'assets/images/video.png',
                        'Employee Information', 'Tell us about your job', 0),
                    SizedBox(
                      height: 20,
                    ),
                    LoanApplicationWidget(context, 'assets/images/video.png',
                        'Take a selfie', 'Upload your selfie image', 0),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Need Help?',
                      style: GoogleFonts.poppins(
                        color: Color(0xff333B63),
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Request a call back ',
                          style: GoogleFonts.poppins(
                            color: Color(0xff333B63),
                            fontWeight: FontWeight.w600,
                            fontSize: 12
                          ),
                        ),
                        Text(
                          'Call Me',
                          style: GoogleFonts.poppins(
                            color: Color(0xff1965F2),
                            fontWeight: FontWeight.w600,
                            fontSize: 12
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(33, 12, 33, 12),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xff2799EB), Color(0xff1354D1)],
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Start Application',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xffffffff)),
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

  Widget LoanApplicationWidget(BuildContext context, String image, String title,
      String content, int progress) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
          color: Color(0xd365ef1), borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 39.25,
                  decoration: BoxDecoration(
                      color: Color(0xffF8F8F8),
                      borderRadius: BorderRadius.circular(4)),
                  child: Image.asset(
                    image,
                    width: 35.86,
                  )),
              SizedBox(
                width: 9,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xff333B63)),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(bottom: 3),
                                  width:
                                      MediaQuery.of(context).size.width * .65,
                                  child: Text(
                                    content,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color(0xff333B63)),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'View Details',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color(0xff365EF1)),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    CupertinoIcons.arrow_right,
                                    color: Color(0xff365EF1),
                                    size: 19,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Stack(
                        //   alignment: Alignment.center,
                        //   children: [
                        //     SizedBox(
                        //       height: 48,
                        //       width: 48,
                        //       child: CircularProgressIndicator(
                        //         value: progress / 100,
                        //         color: Color(0xff1965F2),
                        //         backgroundColor: Color(0x331965f2),
                        //         strokeCap: StrokeCap.round,
                        //       ),
                        //     ),
                        //     Text(
                        //       '$progress%',
                        //       style: GoogleFonts.poppins(
                        //           fontWeight: FontWeight.w600,
                        //           fontSize: 12,
                        //           color: Color(0xff1965F2)),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
