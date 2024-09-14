import 'dart:ui';

import 'package:cfl/screens/authentication/login_phone.dart';
import 'package:cfl/screens/permissions/permissions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/slider_intro_controller.dart';

class SliderIntroScreen extends StatelessWidget {
  final SliderController sliderController = Get.put(SliderController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff365EF1), Color(0xff2799EB)],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        )),
        child: Center(
          child: GetBuilder<SliderController>(
            builder: (controller) {
              return Stack(
                children: [
                  PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    onPageChanged: (p) {
                      // sliderController.currentPage.value = p;
                    },
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .63,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
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
                                    bottom: 0,
                                    child: Image.asset(
                                      'assets/images/slider1img.png',
                                      scale: 2,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Text(
                              'We provide personal loans to make your dream into reality.',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .63,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
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
                                    bottom: 35,
                                    child: Image.asset(
                                      'assets/images/slider2img.png',
                                      scale: 1,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Text(
                              'Get funds in a flash, because your aspirations can’t wait.',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .63,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
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
                                    bottom: 0,
                                    child: Image.asset(
                                      'assets/images/slider3img.png',
                                      scale: 2,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Text(
                              'Benefit from competitive rates, optimizing your financial commitments.',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 60,
                    left: 38,
                    child: Row(
                      children: [
                        Obx(() => Container(
                              width: sliderController.currentPage.value != 0
                                  ? 6
                                  : 36,
                              height: 7,
                              decoration: BoxDecoration(
                                  color: sliderController.currentPage.value != 0
                                      ? Colors.grey
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            )),
                        SizedBox(
                          width: 3,
                        ),
                        Obx(() => Container(
                              width: sliderController.currentPage.value != 1
                                  ? 6
                                  : 36,
                              height: 7,
                              decoration: BoxDecoration(
                                  color: sliderController.currentPage.value != 1
                                      ? Colors.grey
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            )),
                        SizedBox(
                          width: 3,
                        ),
                        Obx(() => Container(
                              width: sliderController.currentPage.value != 2
                                  ? 6
                                  : 36,
                              height: 7,
                              decoration: BoxDecoration(
                                  color: sliderController.currentPage.value != 2
                                      ? Colors.grey
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                      right: 30,
                      bottom: 36,
                      child: InkWell(
                          onTap: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setBool('isFirstTime', false);
                            // Get.off(()=>LoginPhoneScreen());
                            Get.off(()=>PermissionsScreen());
                          },
                          child: Image.asset(
                            'assets/images/finishIntro.png',
                            scale: 1.8,
                          )))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
