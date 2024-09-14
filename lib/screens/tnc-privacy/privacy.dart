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

class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicy({super.key});

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
                                'Privacy Policy',
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
                                'Please read our Privacy Policy carefully',
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
                        'Capital Fast Loan ("we," "us," "our") values your privacy and is '
                            'committed to protecting your personal information. This Privacy Policy '
                            'outlines how we collect, use, disclose, and safeguard your information '
                            'when you visit our website and use our services. By accessing our '
                            'website and using our services, you agree to the terms of this Privacy Policy.',
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
                        '1. Information We Collect',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: const Color(0xff333B63)),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Personal Information: ',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: const Color(0xff333B63))),
                        TextSpan(
                            text: ' When you apply for a loan or use our services, we may collect personal information, including but not limited to:',
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
                            text:
                                'Full Name',
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
                            text:
                                'Address',
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
                            text:
                                'Email Address',
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
                            text:
                                'Phone Number',
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
                            text:
                                'Date of Birth',
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
                            text:
                                'Social Security number or other identification number',
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
                            text:
                                'Financial information (bank account details, income, '
                                    '\n       credit history)',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color(0xff333B63))),
                      ])),
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Non-Personal Information: ',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                            TextSpan(
                                text: ' We may also collect non-personal information about your visit to our website, including but not limited to:',
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
                                text:
                                'Browser type and version',
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
                                text:
                                'Operating system',
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
                                text:
                                'Pages you visit on our website',
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
                                text:
                                'Time and date of your visit',
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
                                text:
                                'IP address',
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
                                text:
                                'Referring website',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                          ])),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        '2. How We Use Your Information',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: const Color(0xff333B63)),
                      ),
                      Text(
                          'We use the information we collect for various purposes, including:',
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
                            text: 'Processing and evaluating your loan application',
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
                            text: 'Verifying your identity and eligibility',
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
                            text: 'Managing your account and providing customer\n       support',
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
                            text: 'Communicating with you about your loan status and\n       updates',
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
                            text: 'Conducting data analysis and improving our services',
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
                            text: 'Complying with legal and regulatory requirements',
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
                            text: 'Preventing fraud and enhancing security',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color(0xff333B63))),
                      ])),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        '3. How We Share Your Information',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: const Color(0xff333B63)),
                      ),
                      Text(
                          'We may share your information with third parties under the following circumstances:',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '1.  Service Providers:',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                            TextSpan(
                                text: ' We may share your information with third-party service providers who assist us in providing our services, such as payment processors, credit bureaus, and customer support.',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                          ])),
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '2.  Legal Requirements:',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                            TextSpan(
                                text: ' We may disclose your information if required to do so by law or in response to valid requests by public authorities (e.g., court orders, subpoenas).',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                          ])),
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '3.  Business Transfers:',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                            TextSpan(
                                text: ' If we undergo a merger, acquisition, or sale of assets, your information may be transferred as part of that transaction.',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                          ])),
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '4.  Protection of Rights:',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                            TextSpan(
                                text: ' We may disclose your information to protect our rights, property, or safety, as well as the rights, property, and safety of our users and others.',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                          ])),

                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        '4. Data Security',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: const Color(0xff333B63)),
                      ),
                      Text(
                          'We implement a variety of security measures to protect your personal information from unauthorized access, use, or disclosure. These measures include encryption, access controls, and secure data storage. However, no method of transmission over the internet or electronic storage is completely secure, and we cannot guarantee absolute security.',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        '5. Your Choices and Rights',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: const Color(0xff333B63)),
                      ),
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '1.  Access and Update:',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                            TextSpan(
                                text: ' You have the right to access and update your personal information. You can do this by logging into your account or contacting us directly.',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                          ])),
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '2.  Opt-Out:',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                            TextSpan(
                                text: ' You may opt-out of receiving promotional communications from us by following the unsubscribe instructions in those communications or by contacting us.',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                          ])),
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '3.  Data Deletion:',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                            TextSpan(
                                text: ' You can request the deletion of your personal information, subject to legal and regulatory requirements. We will take reasonable steps to delete your information as requested.',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: const Color(0xff333B63))),
                          ])),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        '6. Cookies and Tracking Technologies',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: const Color(0xff333B63)),
                      ),
                      Text(
                          'We use cookies and similar tracking technologies to enhance your experience on our website. Cookies are small data files stored on your device that help us understand your preferences and improve our services. You can manage your cookie preferences through your browser settings.',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        '7. Third-Party Links',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: const Color(0xff333B63)),
                      ),
                      Text(
                          'Our website may contain links to third-party websites. We are not responsible for the privacy practices or content of these websites. We encourage you to review the privacy policies of any third-party websites you visit.',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        '8. Children\'s Privacy',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: const Color(0xff333B63)),
                      ),
                      Text(
                          'Our services are not intended for individuals under the age of 18. We do not knowingly collect personal information from children. If we become aware that we have collected personal information from a child under 18, we will take steps to delete such information promptly.',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        '9. Changes to This Privacy Policy',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: const Color(0xff333B63)),
                      ),
                      Text(
                          'We may update this Privacy Policy from time to time to reflect changes in our practices or for other operational, legal, or regulatory reasons. We will notify you of any significant changes by posting the new Privacy Policy on our website. Your continued use of our services after any changes indicates your acceptance of the updated Privacy Policy.',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff333B63))),
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
                        'By using our services and accessing are website, you acknowledge that you have read, understood, and agree to this Privacy Policy.',
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
