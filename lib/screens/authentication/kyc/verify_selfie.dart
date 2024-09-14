import 'package:cfl/controllers/kyc/verify_selfie_controller.dart';
import 'package:cfl/screens/authentication/kyc/camera/camera_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/occupation/business_info_controller.dart';
import '../../../service/permission_service.dart';

class VerifyYourselfWithSelfie extends StatelessWidget {
  VerifyYourselfWithSelfie({super.key});

  final VerifySelfieController cont = Get.put(VerifySelfieController());
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
                              SizedBox(
                                height: 90,
                              ),
                              Text(
                                'Verify yourself\nwith Selfie',
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
                                'Upload your selfie to help\nus verify you',
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
                    Text(
                      'Take selfie to verify your identity',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff333B63)
                      ),
                    ),
                    SizedBox(height: 14,),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff333B63)
                      ),
                    ),
                    SizedBox(height: 24,),
                    Image.asset('assets/images/selfie.png'),
                    SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () async {
                            await _permissionsService.requestPermissions();
                            // Get.to(() => KYCInfo());
                            Get.to(()=>CameraScreen());
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
                              'Take a selfie',
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
