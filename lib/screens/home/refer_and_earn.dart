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

class ReferAndEarn extends StatelessWidget {
  ReferAndEarn({super.key});

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
                                'Refer & Earn',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Refer to your friends & family\nand earn real money',
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
                      Positioned(
                        left: 30,
                        top: 75,
                        child: InkWell(
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
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/refer.png'),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 30, right: 40, top: 20, bottom: 20),
                      decoration: BoxDecoration(
                          color: Color(0xd365ef1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/video.png',
                            width: 53.52,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Share Invite Code',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff333B63)),
                              ),
                              Text(
                                'IDSSXXA5212',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff365EF1)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 20, bottom: 20),
                      decoration: BoxDecoration(
                          color: Color(0xd365ef1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/video.png',
                            width: 51.93,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Invite your friends',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff333B63)),
                                ),
                                Text(
                                  'On registration your friend gets 200 rupees.',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff333B63)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(60, 12, 60, 12),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xff2799EB), Color(0xff1354D1)],
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/email.png', width: 24,),
                            SizedBox(width: 10,),
                            Text(
                              'Invite',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xffffffff)),
                            ),
                          ],
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
