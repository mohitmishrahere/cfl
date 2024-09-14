import 'package:cached_network_image/cached_network_image.dart';
import 'package:cfl/api/api_const.dart';
import 'package:cfl/controllers/nav/home_screen_controller.dart';
import 'package:cfl/controllers/nav/home_screen_controller.dart';
import 'package:cfl/screens/home/loan_application.dart';
import 'package:cfl/screens/home/notification.dart';
import 'package:cfl/screens/home/refer_and_earn.dart';
import 'package:cfl/screens/home/request_loan/request_loan.dart';
import 'package:cfl/screens/home/support_center.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final String name, profilePic;

  HomeScreen({required this.name, required this.profilePic});

  final HomeScreenController cont = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 80),
                            child: Container(
                              decoration: const BoxDecoration(
                                  // color: Colors.white,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff365EF1),
                                      Color(0xff2799EB)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40))),
                              padding: const EdgeInsets.only(
                                  top: 73, left: 40, bottom: 73, right: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(62),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: CachedNetworkImage(
                                          height: 56,
                                          width: 56,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        strokeWidth: 1,
                                                        color: Colors.red,
                                                      ))),
                                          imageUrl: APIConstants.BASE_URL +
                                              profilePic,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 17,
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hi, $name',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Welcome back',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )),
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
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              top: 155,
                              right: 25,
                              left: 25,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 17, left: 17, right: 17),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x21212121),
                                      // The shadow color with 20% opacity
                                      offset: Offset(0, 4),
                                      // Horizontal and vertical offset
                                      blurRadius: 12, // The blur radius
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/icons/income.png',
                                                  width: 13,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Total Credit Limit',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 11,
                                                      color: Color(0xff333B63)),
                                                )
                                              ],
                                            ),
                                            Obx(()=> Text(
                                                '₹${cont.totalLimit.value}',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff333B63)),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          width: 1,
                                          height: 44,
                                          color: Color(0xff344054),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/icons/credit.png',
                                                  width: 13,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Avl. Credit Limit',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 11,
                                                      color: Color(0xff333B63)),
                                                )
                                              ],
                                            ),
                                            Obx(()=> Text(
                                                '₹${cont.availableLimit.value}',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff365EF1)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Image.asset('assets/icons/btm_line.png'),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(() => RequestLoan(), arguments: [cont.availableLimit.value, cont.totalLimit.value]);
                                          },
                                          child: Text(
                                            'Request your loan here',
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff365EF1),
                                                decorationColor:
                                                    Color(0xff365EF1)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Icon(
                                          CupertinoIcons.arrow_right,
                                          size: 20,
                                          color: Color(0xff1965F2),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ))
                        ],
                      )),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 30, bottom: 30),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x21212121),
                              // The shadow color with 20% opacity
                              offset: Offset(0, 4),
                              // Horizontal and vertical offset
                              blurRadius: 12, // The blur radius
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 54,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff365EF1),
                                    Color(0xff2799EB)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Text(
                              'CFL For All Your Needs',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/money.png',
                                  height: 108,
                                ),
                                Expanded(
                                  child: Text(
                                    'Get money within a few clicks. Money will be disbursed from an RBI-registered NBFC.',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff333B63),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _containerWithIconAndText2(
                                  'assets/slider/timer.png',
                                  'Wide range of loan amount'),
                              SizedBox(
                                width: 7,
                              ),
                              _containerWithIconAndText2(
                                  'assets/slider/bank.png',
                                  'Instant Money in account'),
                              SizedBox(
                                width: 7,
                              ),
                              _containerWithIconAndText2(
                                  'assets/slider/payment.png',
                                  'Flexible Repayment'),
                            ],
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => LoanApplication());
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(33, 12, 33, 12),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff2799EB),
                                      Color(0xff1354D1)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Apply for Loan',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xffffffff)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 27,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 30, bottom: 30),
                    child: InkWell(
                        onTap: () {
                          Get.to(() => ReferAndEarn());
                        },
                        child: Image.asset('assets/images/refer.png')),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Instant Loan up to ',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333B63),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      Text(
                        '₹45,000',
                        style: GoogleFonts.poppins(
                            color: Color(0xff304FFE),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 7, bottom: 14),
                    child: Text(
                      'Get money in your bank account within a few minutes. No collateral & 100% paperless process.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Color(0xff333B63),
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 18.0, top: 8),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          _containerWithIconAndText(
                              'assets/slider/timer.png', '10 Mins. Approval'),
                          SizedBox(
                            width: 15,
                          ),
                          _containerWithIconAndText('assets/slider/bank.png',
                              'Instant Money in account'),
                          SizedBox(
                            width: 15,
                          ),
                          _containerWithIconAndText('assets/slider/payment.png',
                              'Flexible Repayment'),
                          SizedBox(
                            width: 15,
                          ),
                          _containerWithIconAndText('assets/slider/payment.png',
                              'Flexible Repayment'),
                          SizedBox(
                            width: 15,
                          ),
                          _containerWithIconAndText('assets/slider/payment.png',
                              'Flexible Repayment'),
                          const SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 30.0, top: 10),
                  //   child: InkWell(
                  //     child: Container(
                  //       padding: const EdgeInsets.fromLTRB(33, 12, 33, 12),
                  //       decoration: BoxDecoration(
                  //           gradient: const LinearGradient(
                  //             colors: [Color(0xff2799EB), Color(0xff1354D1)],
                  //             begin: Alignment.centerLeft,
                  //             end: Alignment.bottomRight,
                  //           ),
                  //           borderRadius: BorderRadius.circular(10)),
                  //       child: Text(
                  //         'Complete Profile',
                  //         style: GoogleFonts.poppins(
                  //             fontWeight: FontWeight.w600,
                  //             fontSize: 16,
                  //             color: Color(0xffffffff)),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 15,
              right: 15,
              child: InkWell(
                onTap: () {
                  Get.to(() => SupportCenter());
                },
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffF3C309),
                        Color(0xffF2A40E)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xBFF4B442),
                        blurRadius: 10,
                        spreadRadius: 0.5,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/icons/headphone.png',
                    scale: 2,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget _containerWithIconAndText(String image, String text) {
    return Container(
      height: 96,
      width: 96,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x21212121),
            // The shadow color with 20% opacity
            offset: Offset(0, 4),
            // Horizontal and vertical offset
            blurRadius: 12, // The blur radius
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 38,
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Color(0xff333B63)),
          )
        ],
      ),
    );
  }

  Widget _containerWithIconAndText2(String image, String text) {
    return Container(
      height: 90,
      width: 90,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xffEBEFFE),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 34,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 9,
                color: Color(0xff333B63)),
          )
        ],
      ),
    );
  }
}
