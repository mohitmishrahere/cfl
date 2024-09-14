// import 'package:cfl/screens/home/notification.dart';
import 'package:cfl/controllers/home/request_loan/request_loan_preview_controller.dart';
import 'package:cfl/screens/home/request_loan/add_new_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api/api_services.dart';
import '../loan_application.dart';

class RequestLoanPreview extends StatelessWidget {
  final RequestLoanPreviewController cont =
      Get.put(RequestLoanPreviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  // height: MediaQuery.of(context).size.height * .63,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Container(
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
                      padding: EdgeInsets.fromLTRB(25, 80, 25, 60),
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
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Request Loan',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Expanded(child: SizedBox()),
                          InkWell(
                            onTap: () {
                              // Get.to(() => NotificationScreen());
                            },
                            child: Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                    color: Color(0xffF2EACB),
                                    borderRadius: BorderRadius.circular(25.71)),
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
                  )),
              Container(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 54,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff365EF1), Color(0xff2799EB)],
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Text(
                          'Your Selected Loan',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 33,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'LOAN TYPE',
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff333b63)),
                                  ),
                                  Text(
                                    'One Payment',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff333b63)),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '1ST DUE DATE',
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff333b63)),
                                  ),
                                  Obx(
                                    () => Text(
                                      cont.dueDate.value,
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff333b63)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 33,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Amount',
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff333b63)),
                                  ),
                                  Text(
                                    '₹${cont.amount.value}',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff333b63)),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tenure',
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff333b63)),
                                  ),
                                  Text(
                                    '${cont.tenure.value} Days',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff333b63)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 33,
                          ),
                          Text(
                            'Bank Account',
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff333b63)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 33,
                          ),
                          Text(
                            cont.bankName.value,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff333b63)),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 20),
                        child: Container(
                            padding: const EdgeInsets.only(
                                top: 13, bottom: 13, left: 13, right: 13),
                            decoration: BoxDecoration(
                              color: Color(0xd304ffe),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  CupertinoIcons.info,
                                  size: 12,
                                  color: Color(0xff333B63),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Your loan has been ',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff333B63),
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'sanctioned',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff365EF1),
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Color(0xff365EF1),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              ' & will be processed by CFL Financial Services Private Limited.',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff333B63),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        top: 19, bottom: 13, left: 13, right: 13),
                    decoration: BoxDecoration(
                      color: Color(0xd304ffe),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select one or two reasons for your loan',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333b63)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: imageAndText('assets/slider/timer.png',
                                    'Mobile Recharge')),
                            SizedBox(
                              width: 14,
                            ),
                            Expanded(
                                child: imageAndText('assets/slider/timer.png',
                                    'Entertainment')),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: imageAndText(
                                    'assets/slider/timer.png', 'Conveyance')),
                            SizedBox(
                              width: 14,
                            ),
                            Expanded(
                                child: imageAndText(
                                    'assets/slider/timer.png', 'Shopping')),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: imageAndText(
                                    'assets/slider/timer.png', 'Food')),
                            SizedBox(
                              width: 14,
                            ),
                            Expanded(
                                child: imageAndText(
                                    'assets/slider/timer.png', 'Other')),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                width: 340,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Obx(
                        () => CheckboxListTile(
                          title: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'I accept all the ',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff333B63),
                                  ),
                                ),
                                TextSpan(
                                  text: 'loan agreement\'s ',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff365EF1),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xff365EF1),
                                  ),
                                ),
                                TextSpan(
                                  text: 'and ',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff333B63),
                                  ),
                                ),
                                TextSpan(
                                  text: 'KFS',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff365EF1),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xff365EF1),
                                  ),
                                ),
                                TextSpan(
                                  text: '.',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff333B63),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          value: cont.isChecked.value,
                          onChanged: (bool? value) {
                            cont.isChecked.value = value!;
                            // if (cont.isChecked.value) {
                            //   setState(() {
                            //     cont.permanent.text = cont.residence.text;
                            //     cont.permanentPincode.text =
                            //         cont.residencePincode.text;
                            //   });
                            // } else {
                            //   setState(() {
                            //     cont.permanent.text = "";
                            //     cont.permanentPincode.text = "";
                            //   });
                            // }
                          },
                          visualDensity: VisualDensity(horizontal: -4),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 60),
                    child: Opacity(
                      opacity: cont.isChecked.value && cont.selectedOptions.isNotEmpty ? 1 : 0.3,
                      child: InkWell(
                        onTap: () async {
                          var response = await APIServices.requestLoan(
                              cont.amount.value,
                              cont.bankId.value,
                              cont.tenure.value,
                              cont.remarks.value);
                          if(response['message'] == 'Your request has been received successfully..'){
                            Fluttertoast.showToast(msg: 'Loan Request Submitted Successully');
                            Get.back(result: 'added');
                            Get.back(result: 'added');
                          }else if(response['message'] == "Can't request another loan untill paid/approved previous."){
                            Fluttertoast.showToast(msg: "Can't submit a new loan request as there is some other ongoing loan or loan request");
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(33, 12, 33, 12),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff2799EB),
                                  Color(0xff1354D1),
                                ],
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Transfer Money',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xffffffff)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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

  Widget imageAndText(String image, String text) {
    return Obx(() {
      bool isSelected = cont.selectedOptions.contains(text);
      return GestureDetector(
        onTap: () => cont.toggleOption(text),
        child: Container(
          height: 68,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.withOpacity(0.3) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image, height: 28),
              const SizedBox(height: 4),
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff333b63),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}