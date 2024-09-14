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

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

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
                                'Notifications',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 40,
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
                    Text(
                      'Today',
                      style:
                          GoogleFonts.poppins(color: const Color(0xff333B63)),
                    ),
                    notificationWidget(
                        context,
                        'assets/images/video.png',
                        'New update',
                        'Set up your automatic savings to meet your savings goal...',
                        '17:00 - April 24', ''),
                    notificationWidget(
                        context,
                        'assets/images/video.png',
                        'New update',
                        'Set up your automatic savings to meet your savings goal...',
                        '17:00 - April 24', 'Groceries |  pantry  |  -\$100,00'),
                    SizedBox(height: 20,),
                    Text(
                      'Yesterday',
                      style:
                      GoogleFonts.poppins(color: const Color(0xff333B63)),
                    ),
                    notificationWidget(
                        context,
                        'assets/images/video.png',
                        'New update',
                        'Set up your automatic savings to meet your savings goal...',
                        '17:00 - April 24', ''),
                    notificationWidget(
                        context,
                        'assets/images/video.png',
                        'New update',
                        'Set up your automatic savings to meet your savings goal...',
                        '17:00 - April 24', 'Groceries |  pantry  |  -\$100,00'),
                    SizedBox(height: 20,),
                    Text(
                      'This weekend',
                      style:
                      GoogleFonts.poppins(color: const Color(0xff333B63)),
                    ),
                    notificationWidget(
                        context,
                        'assets/images/video.png',
                        'New update',
                        'Set up your automatic savings to meet your savings goal...',
                        '17:00 - April 24', ''),
                    notificationWidget(
                        context,
                        'assets/images/video.png',
                        'New update',
                        'Set up your automatic savings to meet your savings goal...',
                        '17:00 - April 24', 'Groceries |  pantry  |  -\$100,00'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget notificationWidget(BuildContext context, String image, String title,
      String content, String time, String extra) {
    return Container(
      padding: EdgeInsets.only(top: 15),
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
                    width: 35.76,
                  )),
              SizedBox(
                width: 9,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff333B63)),
                  ),
                  Container(
                      padding: EdgeInsets.only(bottom: 3),
                      width: MediaQuery.of(context).size.width * .65,
                      child: Text(
                        content,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xff333B63)),
                      )),
                  extra!='' ?Text(
                    extra,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: Color(0xff365EF1)),
                  ) : SizedBox(),
                ],
              )
            ],
          ),
          SizedBox(height: 10,),
          Text(
            time,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Color(0xff1965F2)),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                color: Color(0xff333B63),
                height: 0.5,
              )),
            ],
          )
        ],
      ),
    );
  }
}