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
import '../../api/api_services.dart';

class TermsAndConditions extends StatelessWidget {
  TermsAndConditions({super.key});

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
                              const SizedBox(
                                height: 90,
                              ),
                              Text(
                                'T&Cs',
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
                                'Please read our Terms and\nConditions carefully',
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
                    Text(
                      'Introduction',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    Text(
                      'Welcome to Capital Fast Loan. By accessing or using our website and services, '
                      'you agree to comply with and be bound by the following terms and conditions. '
                      'Please read them carefully. If you do not agree with any part of these terms'
                      ' and conditions, you must not use our services or website.',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color(0xff333B63)),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '1. Definitions',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '   •   "We," "Us," "Our"',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                      TextSpan(
                          text: ' refer to Capital Fast Loan.',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                    ])),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '   •   "You," "Your"',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                      TextSpan(
                          text:
                              ' refer to the user of our services\n        and website.',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                    ])),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '   •   "Loan"',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                      TextSpan(
                          text:
                              ' refers to the financial product offered\n        by Capital Fast Loan.',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                    ])),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '   •   "Website"',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                      TextSpan(
                          text:
                              ' refers to our online platform where\n        you can apply for and manage your loan.',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                    ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '2. Eligibility',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    Text(
                        'To be eligible for a loan from Capital Fast Loan, you must:',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color(0xff333B63))),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '   •   ',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                      TextSpan(
                          text: ' Be at least 18 years old.',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                    ])),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '   •   ',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                      TextSpan(
                          text: ' Be a resident of the country where the service\n        is provided.',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                    ])),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '   •   ',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                      TextSpan(
                          text: ' Provide accurate, current, and complete\n        information during the application process.',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                    ])),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '   •   ',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                      TextSpan(
                          text: ' Have a valid bank account and identification\n        documents.',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                    ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '3. Application Process',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' You must complete and submit the online loan\n        application form.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' We reserve the right to request additional\n        information or documentation to verify your\n        identity and eligibility.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' All applications are subject to our approval criteria,\n        and we reserve the right to reject any application at\n        our discretion.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '4. Loan Terms',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' The loan amount, interest rate, repayment\n        schedule, and any associated fees will be clearly\n        outlined in the loan agreement.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' By accepting the loan agreement, you agree to\n        repay the loan according to the specified terms.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' Early repayment may be allowed, subject to terms\n        outlined in the loan agreement.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '5. Repayment',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' Repayments must be made according to the\n        schedule provided in the loan agreement.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' Late or missed payments may incur additional fees\n        and penalties as specified in the loan agreement.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' We reserve the right to report delinquent accounts\n        to credit reporting agencies.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '6. Privacy and Data Protection',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' We are committed to protecting your privacy and\n        personal information.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' Your data will be used and stored in accordance\n        with our Privacy Policy.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' We may share your information with third parties as\n        necessary to process your loan application and\n        manage your account.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '7. Use of the Website',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' You agree to use our website for lawful purposes\n        only.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' You must not use the website to engage in any\n         fraudulent or malicious activity.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' We are not responsible for any loss or damage\n        arising from your use of the website.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '8. Intellectual Property',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' All content on the website, including text, graphics,\n        logos, and software, is the property of Capital Fast\n        Loan or its licensors.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' You may not reproduce, distribute, or create\n        derivative works from any content on the website\n        without our prior written consent.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '9. Limitation of Liability',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' We will not be liable for any indirect, incidental, or '
                                  '\n        consequential damages arising from your use of'
                                  '\n        our services or website.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' Our liability for any direct damages will be limited'
                                  '\n        to the amount of the loan.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '10. Amendments',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' We reserve the right to amend these terms and'
                                  '\n        conditions at any time.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' Any changes will be posted on our website, and it'
                                  '\n        is your responsibility to review the terms regularly.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' Continued use of our services or website after any'
                                  '\n        changes constitutes your acceptance of the new'
                                  '\n        terms.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '11. Governing Law',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' These terms and conditions are governed by the'
                                  '\n        laws of the jurisdiction where Capital Fast Loan'
                                  '\n        operates.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' Any disputes arising from these terms and'
                                  '\n        conditions will be resolved in the appropriate'
                                  '\n        courts of that jurisdiction.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '12. Electronic Communications',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' By using our website and services, you consent to'
                                  '\n        receive electronic communications from us. These'
                                  '\n        communications may include notices about your'
                                  '\n        account, legal notices, and other information'
                                  '\n        related to your use of our services.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' You agree that any electronic communication will'
                                  '\n        satisfy any legal communication requirements,'
                                  '\n        including that such communications be in writing.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '13. Termination',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' We reserve the right to terminate or suspend your'
                                  '\n        access to our website and services at any time,'
                                  '\n        with or without notice, for any reason, including but'
                                  '\n        not limited to breach of these terms and conditions.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' Upon termination, your right to use our services will'
                                  '\n        immediately cease, and you must return any'
                                  '\n        borrowed funds in accordance with the loan'
                                  '\n        agreement.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '14. Third-Party Links',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' Our website may contain links to third-party'
                                  '\n        websites or services that are not owned or'
                                  '\n        controlled by Capital Fast Loan.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' We have no control over, and assume no'
                                  '\n        responsibility for, the content, privacy policies, or'
                                  '\n        practices of any third-party websites or services.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '15. Entire Agreement',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' These terms and conditions, along with the Privacy'
                                  '\n        Policy and any other legal notices published by us'
                                  '\n        on the website, constitute the entire agreement'
                                  '\n        between you and Capital Fast Loan regarding your'
                                  '\n        use of the website and services.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '   •   ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: ' If any provision of these terms and conditions is'
                                  '\n        found to be invalid by a court of competent'
                                  '\n        jurisdiction, the invalidity of such provision will'
                                  '\n        not affect the validity of the remaining provisions,'
                                  '\n        which will remain in full force and effect.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Contact Information',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [

                          TextSpan(
                              text: 'If you have any questions or concerns about these terms and conditions, please contact us at:',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Capital Fast Loan',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Address : ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: '2nd floor - Khushi tower,  Kumbha Marg, Partap Nagar, Rajasthan',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Phone Number : ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: '+91 9636119944',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Email : ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                          TextSpan(
                              text: 'info@capitalfastloan.com',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xff333B63))),
                        ])),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'By using our services, you acknowledge that you have read, understood, and agree to be bound by these terms and conditions.',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: const Color(0xff333B63)),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () async {
                            Get.back(result: 'res');
                            // var response = await APIServices.acceptTnC();
                            //
                            // await _permissionsService.requestPermissions();
                            //
                            // SharedPreferences prefs =
                            //     await SharedPreferences.getInstance();
                            // prefs.setBool('isT&CAccepted', true);
                            // prefs.setBool('isLoggedIn', true);
                            // // Get.to(() => KYCInfo());
                            // Get.off(() => MainScreen(), arguments: [
                            //   prefs.getString('name') ?? 'User',
                            //   prefs.getString('profilePic') ?? 'User'
                            // ]);
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
                              'Accept & Continue',
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
